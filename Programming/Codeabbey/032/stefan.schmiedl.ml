(*Author stefan.schmiedl*)
let last_man_standing n k =
  let rec go_round rem i = function 
    | [] -> if List.length rem = 1
      then List.hd rem
      else go_round [] i (List.rev rem)
    | x::xs -> go_round (if i mod k = 0 then rem else x::rem) (i+1) xs in
  go_round [] 1 (Array.init n (fun i -> i+1) |> Array.to_list)

let () = 
  Scanf.scanf "%d %d " last_man_standing |> Printf.printf "%d\n"