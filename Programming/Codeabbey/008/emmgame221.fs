//Author emmgame221
let generateSequence first incr n =
  Seq.toList (seq {for x in 0..(n-1) do yield (first + (incr * x))})
[<EntryPoint>]
let main argv =
  let numLines = Int32.Parse (Console.ReadLine())
  let results = Array.create numLines 0
  for i = 1 to numLines do
    let arr = Console.ReadLine().Split()
    let first = Int32.Parse arr.[0]
    let incr = Int32.Parse arr.[1]
    let n = Int32.Parse arr.[2]
    results.[i-1] <- List.sum (generateSequence first incr n)
  for result in results do
    printf "%i " result
  0 // return an integer exit code
