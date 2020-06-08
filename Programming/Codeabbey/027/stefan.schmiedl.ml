(*Author stefan.schmiedl*)
let () =
  let data = Scanf.scanf "%d " (fun n -> Array.init n (fun _ -> Scanf.scanf "%d " (fun n -> n))) in
  let swaps = ref 0 in
  let passes = ref 0 in
  let swapped = ref true in
  let swap i j =
    let k = data.(i) in
    data.(i) <- data.(j);
    data.(j) <- k;
    swapped := true;
    swaps := !swaps + 1 in
  while !swapped do
    passes := !passes + 1;
    swapped := false;
    for i = 0 to Array.length data - 2 do
      if data.(i) > data.(i+1)
      then swap i (i+1)
    done;
  done;
  Printf.printf "%d %d\n" !passes !swaps
