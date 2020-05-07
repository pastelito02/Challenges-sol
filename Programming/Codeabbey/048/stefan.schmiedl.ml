(*Author stefan.schmiedl*)
let rec collatz i = function
  | 1 -> i
  | n when n mod 2 = 0 -> collatz (i+1) (n/2)
  | n -> collatz (i+1) (3*n+1)

let () =
  Scanf.scanf "%d " (fun n ->
            for i = 0 to n - 1 do
            Scanf.scanf "%d " (collatz 0) |> Printf.printf "%d "
            done)
