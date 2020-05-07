(*Author Angie Pacheco*)
let n = read_int();;
let sum = ref 0;;
let aux = ref "Suma";;
let uno = ref 0;;
let dos = ref 0;;
let tres = ref 0;;
let cuatro = ref 0;;
let cinco = ref 0;;
let seis = ref 0;;
let pares = ref 0;;
let band = ref 0;;
let yacht d1 d2 d3 d4 d5 =  sum :=(d1 + d2 + d3 + d4 + d5);
  uno := 0; dos := 0; tres := 0; cuatro := 0; cinco := 0; seis := 0; pares :=0; band :=0;
    if (!sum == 15 )
     then aux := "small-straight"
    else if (!sum == 20 )
     then aux := "big-straight"
    else if(!sum != 20 )
     then aux := "none"
    else if (d1 == 1) then uno := !uno + 1;
    if (d1 == 2) then dos := !dos + 1; if (d1 == 3) then tres := !tres + 1;
    if (d1 == 4) then cuatro := !cuatro + 1; if (d1 == 5) then cinco := !cinco + 1;
    if (d1 == 6) then seis := !seis + 1; if (d2 == 1) then uno := !uno + 1;
    if (d2 == 2) then dos := !dos + 1; if (d2 == 3) then tres := !tres + 1;
    if (d2 == 4) then cuatro := !cuatro + 1; if (d2 == 5) then cinco := !cinco + 1;
    if (d2 == 6) then seis := !seis + 1; if (d3 == 1) then uno := !uno + 1;
    if (d3 == 2) then dos := !dos + 1; if (d3 == 3) then tres := !tres + 1;
    if (d3 == 4) then cuatro := !cuatro + 1; if (d3 == 5) then cinco := !cinco + 1;
    if (d3 == 6) then seis := !seis + 1; if (d4 == 1) then uno := !uno + 1;
    if (d4 == 2) then dos := !dos + 1; if (d4 == 3) then tres := !tres + 1;
    if (d4 == 4) then cuatro := !cuatro + 1; if (d4 == 5) then cinco := !cinco + 1;
    if (d4 == 6) then seis := !seis + 1; if (d5 == 1) then uno := !uno + 1;
    if (d5 == 2) then dos := !dos + 1; if (d5 == 3) then tres := !tres + 1;
    if (d5 == 4) then cuatro := !cuatro + 1; if (d5 == 5) then cinco := !cinco + 1;
    if (d5 == 6) then seis := !seis + 1;

    if(!uno == 2) then pares := !pares + 1; if(!dos == 2) then pares := !pares + 1;
    if(!tres == 2) then pares := !pares + 1; if(!cuatro == 2) then pares := !pares + 1;
    if(!cinco == 2) then pares := !pares + 1; if(!seis == 2) then pares := !pares + 1;

    if(!pares == 2) then aux := "two-pairs"
    else if(!uno == 2) then aux := "pair"
    else if(!dos == 2) then aux := "pair"
    else if(!tres == 2) then aux := "pair"
    else if(!cuatro == 2) then aux := "pair"
    else if(!cinco == 2) then aux := "pair"
    else if(!seis == 2) then aux := "pair";

    if(!pares == 1) then band := !band + 2;
    if(!band != 2) then band := 3
    else if(!uno == 3) then aux := "full-house"
    else if(!dos == 3) then aux := "full-house"
    else if(!tres == 3) then aux := "full-house"
    else if(!cuatro == 3) then aux := "full-house"
    else if(!cinco == 3) then aux := "full-house"
    else if(!seis == 3) then aux := "full-house";

    if(!band < 3) then band := 5
    else if(!uno == 3) then aux := "three"
    else if(!dos == 3) then aux := "three"
    else if(!tres == 3) then aux := "three"
    else if(!cuatro == 3) then aux := "three"
    else if(!cinco == 3) then aux := "three"
    else if(!seis == 3) then aux := "three";

    if(!uno == 4) then aux := "four"; if(!dos == 4) then aux := "four";
    if(!tres == 4) then aux := "four"; if(!cuatro == 4) then aux := "four";
    if(!cinco == 4) then aux := "four"; if(!seis == 4) then aux := "four";
    if(!uno == 5) then aux := "yacht"; if(!dos == 5) then aux := "yacht";
    if(!tres == 5) then aux := "yacht"; if(!cuatro == 5) then aux := "yacht";
    if(!cinco == 5) then aux := "yacht"; if(!seis == 5) then aux := "yacht";

    !aux;;
let juego = Array.make n "anerewr";;
for i=0 to n-1 do
  let values = read_line () in
  let intlist = List.map int_of_string(Str.split (Str.regexp " ") values) in
  let d1 = List.nth intlist 0 in
  let d2 = List.nth intlist 1 in
  let d3 = List.nth intlist 2 in
  let d4 = List.nth intlist 3 in
  let d5 = List.nth intlist 4 in
  let w = yacht d1 d2 d3 d4 d5 in
  juego.(i) <- w
done;;

let () = Array.iter (Printf.printf "%s ") juego;;
