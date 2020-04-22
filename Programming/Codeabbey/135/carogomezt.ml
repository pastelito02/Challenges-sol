(*Author carogomezt*)
let  codes = Hashtbl.create 28;;

Hashtbl.add codes ' ' "11";;
Hashtbl.add codes 'e' "101";;
Hashtbl.add codes 't' "1001";;
Hashtbl.add codes 'o' "10001";;
Hashtbl.add codes 'n' "10000";;
Hashtbl.add codes 'a' "011";;
Hashtbl.add codes 's' "0101";;
Hashtbl.add codes 'i' "01001";;
Hashtbl.add codes 'r' "01000";;
Hashtbl.add codes 'h' "0011";;
Hashtbl.add codes 'd' "00101";;
Hashtbl.add codes 'l' "001001";;
Hashtbl.add codes '!' "001000";;
Hashtbl.add codes 'u' "00011";;
Hashtbl.add codes 'c' "000101";;
Hashtbl.add codes 'f' "000100";;
Hashtbl.add codes 'm' "000011";;
Hashtbl.add codes 'p' "0000101";;
Hashtbl.add codes 'g' "0000100";;
Hashtbl.add codes 'w' "0000011";;
Hashtbl.add codes 'b' "0000010";;
Hashtbl.add codes 'y' "0000001";;
Hashtbl.add codes 'v' "00000001";;
Hashtbl.add codes 'j' "000000001";;
Hashtbl.add codes 'k' "0000000001";;
Hashtbl.add codes 'x' "00000000001";;
Hashtbl.add codes 'q' "000000000001";;
Hashtbl.add codes 'z' "000000000000";;

let hex = Hashtbl.create 17;;

Hashtbl.add hex "0000" "0";;
Hashtbl.add hex "0001" "1";;
Hashtbl.add hex "0010" "2";;
Hashtbl.add hex "0011" "3";;
Hashtbl.add hex "0100" "4";;
Hashtbl.add hex "0101" "5";;
Hashtbl.add hex "0110" "6";;
Hashtbl.add hex "0111" "7";;
Hashtbl.add hex "1000" "8";;
Hashtbl.add hex "1001" "9";;
Hashtbl.add hex "1010" "A";;
Hashtbl.add hex "1011" "B";;
Hashtbl.add hex "1100" "C";;
Hashtbl.add hex "1101" "D";;
Hashtbl.add hex "1110" "E";;
Hashtbl.add hex "1111" "F";;

(* Hashtbl.iter (fun key value -> Printf.printf "%s - %s\n" key value) codes;; *)
let values = read_line ();;

let s = ref "";;
for i = 0 to (String.length values) - 1 do
    let aux = Hashtbl.find codes values.[i] in
    s := !s ^ aux;
done;;

while (String.length !s) mod 8 <> 0 do
    s := !s ^ "0";
done;;

let i = ref 0 ;;
let result = ref "";;
while !i < (String.length !s) do
    let subStr = String.sub !s !i 4 in
    let aux = Hashtbl.find hex subStr in
    result := !result ^ aux;
    i := !i + 4;
done;;

let j = ref 0 ;;
while !j < (String.length !result) do
    let subStr = String.sub !result !j 2 in
    Printf.printf "%s " subStr;
    j := !j + 2;
done;;
