(*Author stefan.schmiedl*)
let smooth ary =
  let smoothed = Array.copy ary in
  for i = 1 to Array.length ary - 2 do
    smoothed.(i) <- (ary.(i-1) +. ary.(i) +. ary.(i+1)) /. 3.0
  done;
  smoothed

let () =
  let data = Scanf.scanf "%d " (fun n -> Array.init n (fun i -> Scanf.scanf "%f " (fun f -> f))) in
  smooth data |> Array.iter (fun f -> Printf.printf "%f " f)