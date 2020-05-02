(*Author stefan.schmiedl*)
let rec sum_of_progression s a b = function
  | 0 -> s
  | n -> sum_of_progression (s + a) (a + b) b (n - 1)

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d %d %d " (sum_of_progression 0)
                        |> Printf.printf "%d "
                      done)
