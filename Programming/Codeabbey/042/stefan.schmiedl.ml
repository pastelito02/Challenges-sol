(*Author stefan.schmiedl*)
let read str =
  let ic = Scanf.Scanning.from_string str in
  let loc = ref [] in
  try
    while true do
      Scanf.bscanf ic "%c " (fun c -> loc := c::!loc)
    done;
    List.rev !loc
  with End_of_file -> List.rev !loc

let rec good_hands = List.filter (fun h -> h <= 21)

let rec print_list oc = function
  | [] -> ()
  | n::ns -> (Printf.printf "%d; " n; print_list oc ns)

let eval loc = 
  let rec loop hands = function
    | [] -> (match hands |> good_hands with
              | [] -> None
              | hs -> Some (List.fold_left (fun m h -> max m h) 0 hs))
    | c::cs -> loop (List.fold_left (fun acc h -> match c with
                                      | 'T' | 'J'
                                      | 'Q' | 'K' -> (10+h)::acc
                                      | 'A'       -> (1+h)::(11+h)::acc
                                      | _         -> ((int_of_char c) - (int_of_char '0') + h)::acc)
                       [] hands) cs in
  loop [0] loc

let print = function
  | Some n -> Printf.printf "%d " n
  | None -> Printf.printf "Bust "

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%s@\n" read |> eval |> print
                      done)