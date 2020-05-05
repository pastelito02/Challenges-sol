(*Author stefan.schmiedl*)
let () =
  Scanf.scanf "%d %d " (fun m n ->
             let counter = Array.make (n+1) 0 in
             for i = 0 to m - 1 do
               Scanf.scanf "%d " (fun x -> counter.(x) <- counter.(x) + 1)
             done;
             for i = 1 to n do
               Printf.printf "%d " counter.(i)
             done)
