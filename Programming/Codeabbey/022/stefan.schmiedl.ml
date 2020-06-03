(*Author stefan.schmiedl*)
(*
 * tx s/p, ty s/p, n pages, k on printer x, n-k on printer y
 * t(k) = max(k*tx, (n-k)*ty)   total printing time for n pages
 * k*tx > (n-k)*ty  <=>  k*(tx+ty) > n*ty  <=>  k > n*ty/(tx+ty)
 * *)


let runs tx ty n =
  let tx' = float_of_int tx in
  let ty' = float_of_int ty in
  let n' = float_of_int n in
  (n'*.ty' /. (tx'+.ty')) |> truncate

let rec min_time tx ty n = 
  let time_for_runs k = max (k*tx) ((n-k)*ty) in
  let k = runs tx ty n in
  min (time_for_runs k) (time_for_runs (k+1))

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d %d %d " min_time |> Printf.printf "%d "
                      done)