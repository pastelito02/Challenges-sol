(*Author stefan.schmiedl*)
let find_primes n =
  let primes = Array.make n 0 in
  primes.(0) <- 2;
  primes.(1) <- 3;

  let rec is_prime i p =
    if primes.(p) * primes.(p) > i
    then true
    else if i mod primes.(p) = 0
    then false
    else is_prime i (p+1) in

  let rec loop p i d =
    if p = n
    then primes
    else if is_prime i 0
    then (primes.(p) <- i; loop (p+1) (i+d) (4-d))
    else loop p (i+d) (4-d) in
  loop 2 5 2

let factorize primes n =
  let rec loop acc i = function
    | 1 -> List.rev acc
    | n -> if n mod primes.(i) = 0
      then loop (primes.(i)::acc) i (n/primes.(i))
      else loop acc (i+1) n in
  loop [] 0 n


let rec print_product oc = function
  | [] -> ()
  | [p] -> Printf.fprintf oc "%d" p
  | p::ps -> (Printf.fprintf oc "%d*" p; print_product oc ps)

let () =
  let primes = find_primes 200000 in
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d " (factorize primes) |> Printf.printf "%a " print_product
                      done)
