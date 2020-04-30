(*Author stefan.schmiedl*)
let combinations n = function
  | 0 -> 1
  | k -> let k = min k (n-k) in
    let rec loop c n = function
      | i when i = k -> c*n/i
      | i -> loop (c*n/i) (n-1) (i+1) in
    loop 1 n 1

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d %d " combinations |> Printf.printf "%d "
                      done)
