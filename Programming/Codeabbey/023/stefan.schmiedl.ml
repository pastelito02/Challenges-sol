(*Author stefan.schmiedl*)
let checksum = Array.fold_left (fun c n -> (c+n)*113 mod 10000007) 0

let () =
  let data =
    let rec loop xs =
      Scanf.scanf "%d " (function
                          | -1 -> List.rev xs |> Array.of_list
                          | n -> loop (n::xs)) in
    loop [] in
  let swaps = ref 0 in
  let swap i j =
    let k = data.(i) in
    data.(i) <- data.(j);
    data.(j) <- k;
    swaps := !swaps + 1 in
  for i = 0 to Array.length data - 2 do
    if data.(i) > data.(i+1)
    then swap i (i+1)
  done;
  Printf.printf "%d %d\n" !swaps (checksum data)
