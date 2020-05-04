(*Author IIIIkuoaIIII*)
let file = "p43.txt" (* input file *)

let solve sList =

  let ascii_code = 48 in
  let rez = ref 0 in

  let rec loop i size string =
    if (i < size) then (
      let digit = int_of_char string.[i] - ascii_code in
      let prod = digit * (i+1) in
      rez := !rez + prod;
      loop (i+1) size string
    )
    else
      Printf.printf "%d " !rez

  in match sList with
     | word::[] ->
    let size = String.length word in
    loop 0 size word
     | _ -> ()

;;





let () =

  (* reading the input, string list list *)

  let sList = Ca.read_input file in

  List.iter solve sList;
  Printf.printf "\n"
