(*Author IIIIkuoaIIII*)
open Printf

let file = "p20.txt"

let numberOfVowels line =
  let counter = ref 0 in
  let countVowel char =
    if (char = 'a' || char = 'o' || char =  'u' || char = 'i' || char =  'e' || char = 'y') then
      incr counter in
  String.iter countVowel line;

  !counter
;;

let () =
  let ic = open_in file in
  printf "\n";
  try
    while true do
      let line = input_line ic in
      (* tokenizing the line *)

      printf "%d " (numberOfVowels line)

    done
  with End_of_file ->
    close_in ic
;;
