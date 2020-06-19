//Author alexander_v
open System
open System.IO

let primes = File.ReadAllText("primes.txt").Split(',') |> Array.map int //Precalculated primes by "Sieve of Eratosthenes"

let count = Convert.ToInt32(Console.ReadLine())

let distance x =
    let a = Console.ReadLine().Split(' ') |> Array.map int
    Array.BinarySearch(primes, a.[1]) + 1 - Array.BinarySearch(primes, a.[0])

[1..count]
|> List.map distance
|> List.iter (printf "%d ")