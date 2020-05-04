(*Author stefan.schmiedl*)
let round f =
  (if f >= 0.0
  then f +. 0.5
  else f -. 0.5)
  |> truncate

let average () =
  let rec loop s c =
  Scanf.scanf "%d " (function
            | 0 -> (float_of_int s) /. (float_of_int c) |> round
            | n -> loop (s+n) (c+1)) in
  loop 0 0

let () =
  Scanf.scanf "%d " (fun n ->
            for i = 0 to n - 1 do
            average () |> Printf.printf "%d "
            done)
