//Author siloimwald
open System.IO
let binSearchCoeff (vals:float[]) =
  let f x = vals.[0] * x + vals.[1] * Operators.sqrt (x**3.0) - vals.[2] * Operators.exp (-x/50.0) - vals.[3]
  let delta = 1e-7;

  let rec testRange lower upper =
    let testValue = (lower + upper)/2.0
    let middleX = f testValue
    let mid = (lower+upper)/2.0
    if (Operators.abs middleX) < delta then
      testValue
    elif middleX > 0.0 then
      testRange lower mid
    else
      testRange mid upper

  // solution within 0-100
  testRange 0.0 100.0

let doSolvePuzzle fname =
  File.ReadAllLines(fname).[1..] |> Array.map (fun s -> s.Split(' ') |> Array.map System.Double.Parse)
  |> Array.map binSearchCoeff |> Array.iter (printf "%f ")
doSolvePuzzle "BinarySearchMathInput.txt"
