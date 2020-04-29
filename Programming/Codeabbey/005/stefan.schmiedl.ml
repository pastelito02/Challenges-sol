(* Author stefan.schmiedl *)
let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        (Scanf.scanf "%d %d %d " (fun a b c -> min a b |> min c)) |> Printf.printf "%d "
                      done)
