(*Author stefan.schmiedl*)
let rec approx_sqrt r x = function
  | 0 -> r
  | n -> approx_sqrt ((r +. x /. r) /. 2.0) x (n-1)

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%f %d " (approx_sqrt 1.0) |> Printf.printf "%f "
                      done)
