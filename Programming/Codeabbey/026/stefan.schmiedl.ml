(*Author stefan.schmiedl*)
let print_pair chan (a,b) =
  Printf.fprintf chan "(%d %d)" a b

let gcd_lcm a b =
  let rec gcd a = function
    | 0 -> a
    | b -> gcd b (a mod b) in
  let g = gcd a b in
  let l = a * b / g in
  (g,l)

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d %d " gcd_lcm |> Printf.printf "%a " print_pair
                      done)