//Author siloimwald
open System.IO

[<EntryPoint>]
let main argv =
  let lines = File.ReadAllLines("Input.txt")
  let vertices =
    Array.map (fun (line:string) -> line.Split(' ') |> Array.map float) lines.[1..]
    |> Array.map (fun arr -> arr.[0], arr.[1]) // convert to tuples

  // pick the centroid for the third point each time
  let vertexCount = Array.length vertices
  let centroid = Array.fold (fun (sx,sy) (x,y) -> (sx+x, sy+y)) (0.0, 0.0) vertices |> (fun (sx,sy) -> (sx/float(vertexCount), sy/float(vertexCount)))

  let buildTriangle index = [| vertices.[index] ; vertices.[(index + 1)%vertexCount] ; centroid |]

  // direct formula from the triangle task
  let triangleArea (entry:(float*float)[]) =
    let (x1,y1) = entry.[0]
    let (x2,y2) = entry.[1]
    let (x3,y3) = entry.[2]
    0.5 * Operators.abs(x1 * (y2-y3) + x2 * (y3-y1) + x3 * (y1-y2))

  Array.mapi (fun idx _ -> buildTriangle idx) vertices |> Array.map triangleArea |> Array.sum |> printfn "%f"

  0
