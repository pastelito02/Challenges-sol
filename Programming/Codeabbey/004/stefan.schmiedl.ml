(* Author stefan.schmiedl *)
let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        (Scanf.scanf "%d %d " min) |> Printf.printf "%d "
                      done)
