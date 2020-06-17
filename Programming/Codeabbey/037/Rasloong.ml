(*Author Rasloong*)
let (p, r, l) = Scanf.scanf " %d %d %d" (fun a b c -> (a, b, c))
let interest = (float_of_int r/. float_of_int 12) *. (float_of_int 1/. float_of_int 100);;
let num=(interest *.(float_of_int 1 +. interest)** float_of_int l);;
let div=((float_of_int 1 +. interest)** float_of_int l -. float_of_int 1);;
let monthly = float_of_int p *. (num/.div);;
let intact=int_of_float monthly;;
let rounding= monthly -. float_of_int intact;;
if (rounding >= 0.35) then Printf.printf "%d" (intact+1) else Printf.printf "%d" (intact);;