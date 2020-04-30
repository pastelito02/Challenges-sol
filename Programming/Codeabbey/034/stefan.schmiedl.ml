(*Author stefan.schmiedl*)
let solve a b c d =
  let fn x = a *. x +. b *. sqrt(x ** 3.0) -. c *. exp (-. x /. 50.0) -. d in
  let rec loop l r =
    let m = (l +. r) /. 2.0 in
    if r -. l < 1.0e-7
    then m
    else if fn m > 0.0
    then loop l m
    else loop m r in
  loop 0.0 100.0

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%f %f %f %f " solve |> Printf.printf "%12.8f "
                      done)
