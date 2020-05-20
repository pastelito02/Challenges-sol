(*Author stefan.schmiedl*)
module C = struct
  type t = { r:int; i:int }
  let make (r,i) = { r; i }
  let p c = function
    | {r;i=0} -> Printf.fprintf c "%d" r
    | {r;i} -> Printf.fprintf c "%d%+di" r i
end

let isqrt x = float_of_int x |> sqrt |> truncate

let find_roots a b c =
  let d = b * b - 4 * a * c in
  if d > 0
  then let d' = isqrt d in
    (C.make((-b+d')/2/a, 0),C.make((-b-d')/2/a, 0))
  else if d = 0
  then (C.make(-b/2/a,0), C.make(-b/2/a,0))
  else let d' = isqrt (-d) in
    (C.make(-b/2/a,d'/2/a), C.make(-b/2/a,-d'/2/a))

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        let (a,b) = Scanf.scanf "%d %d %d " find_roots in
                        Printf.printf "%a %a; " C.p a C.p b
                      done)