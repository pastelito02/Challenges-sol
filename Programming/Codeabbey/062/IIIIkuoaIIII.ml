(*Author IIIIkuoaIIII*)
let file = "p62.txt" (* input file *)

let is_prime n =
  let rec not_divide i =
    (i * i > n) ||  (n mod i <> 0 && not_divide (i + 1))
  in not_divide 2

        
let primes_between a b =

  let rec loop i rez =
    if (i > b) then
      rez
    else if (is_prime i) then
      loop (i+1) (i :: rez)
    else loop (i+1) rez
  in loop a []
  

    
let solve input  =
  let i_input = List.map int_of_string input in

  match i_input with
  | a::b::[] -> List.length (primes_between a b)
        |> Printf.printf "%d "

  | _ -> failwith "Wrong format"
  

                   
let main () =  
  (* reading the input, string list list *)
  Ca.read_input_l file
  |> List.iter solve
  
             
let () = main ()             
