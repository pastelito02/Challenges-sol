//Author siloimwald

open System.IO

let rec qsort lst =
    match lst with
    | [] -> []
    | (i,x)::xs -> 
        (qsort (List.filter (fun (_,t) -> t <= x) xs)) @ [(i,x)] @ (qsort (List.filter (fun (_,t) -> t > x) xs))

let readInput fname =
    // simply inject index and pass it through while doing the qsort, mapi to the rescue
    File.ReadAllLines(fname).[1] |> (fun s -> s.Split(' ') |> Array.map System.Int32.Parse)
    |> Array.mapi (fun idx item -> (1+idx), item) |> Array.toList |> qsort |> List.iter (fun (idx, item) -> printf "%d " idx)  
    
readInput "SortWithIndexInput.txt"