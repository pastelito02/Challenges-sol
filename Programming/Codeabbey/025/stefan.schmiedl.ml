(*Author stefan.schmiedl*)
let rec prng a c m x0 = function
  | 0 -> x0
  | n -> prng a c m ((a*x0+c) mod m) (n-1)

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d %d %d %d %d " prng |> Printf.printf "%d "
                      done)