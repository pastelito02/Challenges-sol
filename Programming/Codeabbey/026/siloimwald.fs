//Author siloimwald

open System.IO

let rec gcd x y =
    if x = y then x
    else
        let smaller, bigger = Operators.min x y, Operators.max x y
        gcd smaller (bigger - smaller) 

let lcm x y = x * y / gcd x y

let readInput fname =
    let mapInput (line:string) =
        let splitted = line.Split(' ') |> Array.map System.Int32.Parse
        splitted.[0], splitted.[1]
    File.ReadAllLines(fname).[1..]
    |> Array.map mapInput
    |> Array.iter (fun (a,b) -> printf "(%d %d) " (gcd a b) (lcm a b))

readInput "GcdInput.txt"