//Author emmgame221
let getDieRoll x =
  x % 6 + 1

[<EntryPoint>]
let main argv =
  let numLines = Int32.Parse (Console.ReadLine())
  let results = Array.zeroCreate numLines
  for i = 1 to numLines do
    let values = List.map Int32.Parse (Array.toList (Console.ReadLine().Split()))
    results.[i-1] <- ((getDieRoll values.[0]) + (getDieRoll values.[1]))
  for result in results do
    printf "%i " result
  0
