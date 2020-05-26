//Author siloimwald
open System
open System.IO

open CodeAbbeyLib.CodeAbbeySimple

[<EntryPoint>]
let main argv =    
    
    let eats (k:string) (q:string) = 
        let t0 = (int 'a') // abuse ascii to transform a-h to 0-8
        let k_col = (int k.[0]) - t0
        let k_row = Int32.Parse <| k.[1].ToString()
        let q_col = (int q.[0]) - t0
        let q_row = Int32.Parse <| q.[1].ToString()
        // same row or same column
        if k_col = q_col || k_row = q_row then
            true
        else
            // check diag, absolute difference for col/row
            Operators.abs (k_col-q_col) = Operators.abs (k_row-q_row)
            

    let lines = File.ReadAllLines("codeAbbeyIn.txt").[1..]
    for config in lines do
        let king = config.Split(' ').[0]
        let queen = config.Split(' ').[1]
        printf "%s " <|
            match (eats king queen) with
                | true -> "Y"
                | false -> "N"
    Console.ReadKey() |> ignore
    0 
