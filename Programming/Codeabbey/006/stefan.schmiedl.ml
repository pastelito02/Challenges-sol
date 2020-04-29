(* Author stefan.schmiedl *)
let round f =
  (if f >= 0.0
  then f +. 0.5
  else f -. 0.5)
  |> truncate

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        (Scanf.scanf "%f %f " (fun num denom -> num /. denom |> round))
                        |> Printf.printf "%d "
                      done)
