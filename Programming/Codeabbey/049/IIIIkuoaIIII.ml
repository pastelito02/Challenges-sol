(*Author IIIIkuoaIIII*)
let file = "p49.txt" (* input file *)

let update_score p1 p2 score =
  (* p1 p2 -> player 1 player 2 *)
  
  match p1,p2 with
  |'P', 'R' | 'R', 'S' | 'S', 'P' -> (              
    let (s1, s2) = !score in
    score := (s1 + 1, s2) )
                         
  |'R', 'P' | 'S', 'R' | 'P', 'S' -> (
    let (s1, s2) = !score in
    score := (s1, s2+1) )
                       
  | _ -> ()

         
let solve s_list =
  let score = ref (0, 0) in
  List.iter (fun x -> (update_score x.[0] x.[1] score) ) s_list;

  let (s1, s2) = !score in
  if (s1 > s2) then
    Printf.printf "1 "
  else
    Printf.printf "2 "
          
            
let main () =

  (* reading the input, string list list *)
  Ca.read_input_l file
  |> List.iter solve;
  print_newline ()

let () = main ()  