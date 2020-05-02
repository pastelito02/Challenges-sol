(*Author CcGaviria*)
let calcula d1 d2 =
  let a = (d1/.100.) +. (d2/.100.) -.((d1/.100.)*.(d2/.100.)) in
  let b = (d1/.100.) /. a   in
  let c = b *. 100. in
  let c = c+.0.488888 in
 (* let res = 100. *. re in
 (d1/.100.)+(d2/.100.)-((d1/.100.)*.(d2/.100.))
  *)(a, b, int_of_float c)

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        let (a,b,c) = Scanf.scanf "%f %f " calcula in
                        Printf.printf "%d " c




                      done)
