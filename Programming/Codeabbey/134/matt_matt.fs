//Author matt_matt
namespace Abbey

module FlyingText =
  let W = 30
  let H = 13
  let L = 9

  type Cursor = { x:int; y:int; dirX:int; dirY:int }

  let dL (c:Cursor) =
    c.x

  let dT (c:Cursor) =
    c.y

  let dR (c:Cursor) =
    W - (c.x + L)

  let dB (c:Cursor) =
    H - (c.y + 1)

  let nextPos (c:Cursor):Cursor =
    let newDirX =
      match c.dirX with
      | 1 -> if (dR c) <= 0 then -1 else 1
      | _ -> if (dL c) <= 0 then 1 else -1

    let newDirY =
      match c.dirY with
      | 1 -> if (dB c) <= 0 then -1 else 1
      | _ -> if (dT c) <= 0 then 1 else -1

    { x = (c.x + newDirX); y = (c.y + newDirY); dirX = newDirX; dirY = newDirY }

  let Go N =

    let cursor = { x = 0; y = 0; dirX = 1; dirY = 1 }

    let posHistory =
      Seq.unfold (fun state ->
        if (fst state > N) then None
        else Some(snd state, ((fst state + 1), nextPos (snd state)))) (0, cursor)

    let printCursorPos (c:Cursor) =
      printf "%A %A " c.x c.y

    posHistory |> (Seq.map printCursorPos) |> Seq.length

module Main =
  open System

  [<EntryPoint>]
  let main argv =

    let res = FlyingText.Go 100

    Console.ReadKey() |> ignore

    0 // return
