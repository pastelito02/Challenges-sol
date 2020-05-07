//Author siloimwald
open System
open System.IO

open CodeAbbeyLib.CodeAbbeySimple

[<EntryPoint>]
let main argv =

  let collatz v =
    let isEven v = (v%2)=0
    let rec collatz' v' c =
      if v' = 1 then c
      else
      match isEven v' with
        | true -> collatz' (v'/2) (c+1)
        | false -> collatz' (v'*3 + 1) (c+1)
    collatz' v 0

  File.ReadAllLines("codeAbbeyIn.txt").[1] |> lineToNumArray Int32.Parse |> Array.map collatz |> Array.iter (fun item -> printf "%d " item)

  Console.ReadKey() |> ignore
  0
