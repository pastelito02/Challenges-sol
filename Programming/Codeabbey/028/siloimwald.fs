//Author siloimwald
open System
open System.IO

open CodeAbbeyLib.CodeAbbeySimple
open System.Globalization

let bmi w h = w / h**2.0

let catBmi bmiValue =
    match bmiValue with
    | bmiValue when bmiValue < 18.5 -> "under"
    | bmiValue when bmiValue >= 18.5 && bmiValue < 25.0 -> "normal"
    | bmiValue when bmiValue >= 25.0 && bmiValue < 30.0 -> "over"
    | _ -> "obese"

[<EntryPoint>]
let main argv =     
    let converter v = Double.Parse(v, CultureInfo.InvariantCulture) // ,.
    for input in File.ReadAllLines("codeAbbeyIn.txt").[1..] do        
        let line = lineToNumArray input converter        
        bmi line.[0] line.[1] |> catBmi |> printf "%s "

    Console.ReadKey() |> ignore
    0 
