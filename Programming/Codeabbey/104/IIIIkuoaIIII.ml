(*Author IIIIkuoaIIII*)
let file = "p104.txt" (* input file *)

let area a b c =
  let s = (a +. b +. c) /. 2.0 in
  sqrt (s *. (s -. a) *. (s -. b) *. (s -. c))
;;

let length x1 y1 x2 y2 =
  sqrt ( (x2 -. x1) ** 2.0 +. (y2 -. y1) ** 2.0)
;;


let solve s_list =
  let f_list = List.map (float_of_string) s_list in

  match f_list with
  | x1::y1::x2::y2::x3::y3::[] ->
     let a = length x1 y1 x2 y2 in
     let b = length x1 y1 x3 y3 in
     let c = length x2 y2 x3 y3 in
     Printf.printf "%.8f " (area a b c)

  | _ -> failwith "Wrong format in solve"


let main () =

  (* reading the input, string list list *)
  Ca.read_input_l file
  |> List.iter solve;
  print_newline ()

let () = main ()
