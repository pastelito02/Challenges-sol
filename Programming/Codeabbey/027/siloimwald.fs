//Author siloimwald
open System
open System.IO

open CodeAbbeyLib.CodeAbbeySimple

[<EntryPoint>]
let main argv =    
    // the not-so-functional bubble-sort :)
    let bubbleSort (arr:int []) =
        let rec doPass passesMade swapsMade =
            let mutable swappedSomething = false
            let mutable swapsThisPass = 0
            for k = 0 to arr.Length-2 do
                if arr.[k] > arr.[k+1] then
                    let tmp = arr.[k]
                    arr.[k] <- arr.[k+1]
                    arr.[k+1] <- tmp
                    swapsThisPass <- swapsThisPass + 1
                    swappedSomething <- true
            if swappedSomething then                 
                doPass (passesMade+1) (swapsMade+swapsThisPass)
            else
                passesMade+1, (swapsMade+swapsThisPass)
        let passesMade, swapsMade = doPass 0 0
        printfn "%d %d" passesMade swapsMade

    File.ReadAllLines("codeAbbeyIn.txt").[1] |> lineToNumArray Int32.Parse |> bubbleSort    
    Console.ReadKey() |> ignore
    0 
