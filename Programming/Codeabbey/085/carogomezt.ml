(*Author carogomezt*)
let n = Scanf.scanf "%d "(fun n ->  n);;
let a = Scanf.scanf "%f\n"(fun a ->  a);;

let pi = 4.0 *. atan 1.0;;

let deg_to_rad n =  let r = ref 0.0 in
                    r := (n *. pi) /. 180.0;
                    !r;;

let rotationX x y a =  let xi = ref 0.0 in
                    xi := (x *. cos (a)) -. (y *. sin (a));
                    !xi;;

let rotationY x y a = let yi = ref 0.0 in
                    yi := (x *. sin (a)) +. (y *. cos (a));
                    !yi;;

let printArray r = Array.iter (Printf.printf "%d ") r;;
let printStringArray r = Array.iter (Printf.printf "%s ") r;;
let stars = Array.make n "a";;
let xpoints = Array.make n 0;;
let ypoints = Array.make n 0;;
for i = 0 to n-1 do
    let s = Scanf.scanf "%s "(fun s ->  s) in
    let x = Scanf.scanf "%f "(fun x ->  x) in
    let y = Scanf.scanf "%f\n"(fun y ->  y) in
    let xr = rotationX x y (deg_to_rad (a)) in
    let yr = rotationY x y (deg_to_rad (a)) in
    stars.(i) <- s;
    xpoints.(i) <- int_of_float (xr);
    ypoints.(i) <- int_of_float (yr);
    (* Printf.printf "%f %f " yr xr; *)
done;;

(* printStringArray stars;;
Printf.printf "\n" ;;
printArray xpoints;;
Printf.printf "\n" ;;
printArray ypoints;;
Printf.printf "\n" ;; *)


for i = 0 to n-1 do
    let minValue = ref max_int in
    let index = ref 0 in
    for j = i to n-1 do
        if ypoints.(j) < !minValue then
        begin
            index := j;
            minValue := ypoints.(j);
        end;

    done;
    let x_aux = xpoints.(i) in
    let y_aux = ypoints.(i) in
    let s_aux = stars.(i) in
    xpoints.(i) <- xpoints.(!index);
    ypoints.(i) <- ypoints.(!index);
    stars.(i) <- stars.(!index);
    xpoints.(!index) <- x_aux;
    ypoints.(!index) <- y_aux;
    stars.(!index) <- s_aux;
done;;

printStringArray stars;;