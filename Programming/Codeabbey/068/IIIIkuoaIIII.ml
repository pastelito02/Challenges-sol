(*Author IIIIkuoaIIII*)
let file = "p68.txt" (* input file *)


let solve s_list =
  let open Printf in
  let i_list = List.map (float_of_string) s_list in

  match i_list with
  | d::v1::v2::[] ->
     let t = d /. (v1 +. v2) in
     printf "%.8f " (t *. v1)



  | _ -> failwith "wrong format"

let () =

  (* reading the input, string list list *)
  let sList = Ca.read_input_l file in
  List.iter solve sList;
  Printf.printf "\n"
