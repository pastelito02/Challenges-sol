open System

let round (n:float) (d:float) =
  int (Math.Round( n / d ))

let count = Convert.ToInt32(Console.ReadLine())

for i = 1 to count do
  printf "%d " (Console.ReadLine().Split(' ')
  |> Array.map float
  |> fun x -> round (float (Array.sum x)) (float (Array.length x.[1..])) )
