(*Author stefan.schmiedl*)
let len = 14

let scan str =
  let ic = Scanf.Scanning.from_string str in
  Array.init len (fun i -> Scanf.bscanf ic "%f " (fun n -> n))

let mean ary =
  let sum = Array.fold_left (fun t x -> t +. x) 0.0 ary in
  sum /. (float_of_int len)

let variance ary =
  let m = mean ary in
  Array.map (fun x -> (m -. x)**2.0) ary |> mean

let stddev ary = sqrt (variance ary)

let commission ary = 0.01 *. (mean ary)

let print_volatiles stock ps =
  let prices = scan ps in
  if (stddev prices) > (4.0 *. (commission prices))
  then Printf.printf "%s " stock

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%s %s@\n" print_volatiles
                      done)
