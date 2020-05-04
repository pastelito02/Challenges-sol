(*Author stefan.schmiedl*)
let dice_it f = f *. 6.0 |> truncate |> ( + ) 1

let () =
  Scanf.scanf "%d " (fun n ->
            for i = 0 to n - 1 do
            Scanf.scanf "%f " dice_it |> Printf.printf "%d "
            done)
