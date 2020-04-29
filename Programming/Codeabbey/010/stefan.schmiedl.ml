(* Author stefan.schmiedl *)
let linear x1 y1 x2 y2 =
  let a = (y2 - y1) / (x2 - x1) in
  let b = y1 - a * x1 in
  (a,b)

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        let (a,b) = Scanf.scanf "%d %d %d %d " linear in
                        Printf.printf "(%d %d) " a b
                      done)
