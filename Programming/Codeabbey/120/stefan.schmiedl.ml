(*Author stefan.schmiedl*)
let () =
  let data = Scanf.scanf "%d " (fun n -> Array.init n (fun i -> Scanf.scanf "%d " (fun n -> n))) in

  let rec max_index i = function
    | -1 -> i
    | k -> max_index (if data.(i) > data.(k) then i else k) (k-1) in

  let swap i j =
    let v = data.(i) in
    data.(i) <- data.(j);
    data.(j) <- v in

  for i = (Array.length data) - 1 downto 1 do
    let m = max_index i (i-1) in
    Printf.printf "%d " m;
    swap m i
  done