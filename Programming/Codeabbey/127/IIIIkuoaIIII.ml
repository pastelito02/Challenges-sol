(*Author IIIIkuoaIIII*)
let file = "p127.txt" (* input file *)
let dictionary = "words1.txt"

(* For the moment i use only the stdlib, so i am obligated to write all the functions
even the ones that are usually provided with Core or Batteries *)


let insert_all e list =
  (* inserts e in positions in list *)
  (* acc1 is the list that grows | acc2 is the list that shrinks while we advance *)

  let rec loop acc1 acc2 rez =
    match acc2 with
    | [] -> rez
    | h::t ->
       loop (h::acc1) t ((List.rev_append acc1 (h::e::t)) :: rez)
  in loop [] list [e::list]


let rec permutations l =
  (* to generate permutations, insert the element in the already generated permutations *)

  match l with
  | [] -> [[]]
  | h :: t ->
     List.fold_left (fun acc x -> List.rev_append (insert_all h x) acc) [] (permutations t)

let s_to_c_list string =
  (* converts a string to a char list *)

  let size = String.length string in
  let rec loop i acc =
    if i >= size then
      List.rev acc
    else
      loop (i+1) (string.[i] :: acc)
  in loop 0 []

let rec c_list_to_s c_list =
  (* converts a char_list to a string *)

  let size = List.length c_list in
  let bytes = Bytes.make size ' ' in
  List.iteri (fun i x -> Bytes.set bytes i x) c_list;
  Bytes.to_string bytes

let read_dictionary words =
  (* read the dictionary and create a hashtable *)

  let list_w = Ca.read_input_l words in
  let htbl = Hashtbl.create (List.length list_w) in
  List.iter (fun x -> let word = List.hd x in Hashtbl.add htbl word word) list_w;
  (* Printf.printf "%d elemente\n" (Hashtbl.length htbl); *)
  htbl

let () =
  let counter = ref 0 in
  let words = Ca.read_input_l file in (* words to be checked *)
  let dictionary = read_dictionary dictionary in (* hashtbl containing the dictionary *)
  let count_anagrams word =

    let c_list = s_to_c_list word in (* char list *)
    let permutation_list = permutations c_list in (* list of char list permutations *)
    let string_list = List.map c_list_to_s permutation_list in (* string list permutations *)
    (* if word contains two times the same letter, we will have dublicates *)
    let string_list_clean = List.sort_uniq compare string_list in
    List.iter (fun x -> if (Hashtbl.mem dictionary x) then incr counter) string_list_clean;

    if (!counter > 0) then decr counter;
    Printf.printf "%d " !counter;

    counter := 0;

  in List.iter (fun x -> let word = List.hd x  in (* Printf.printf "%s " word; *) count_anagrams word) words
