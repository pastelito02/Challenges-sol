(*Author stefan.schmiedl*)
type card = {
  r: char;
  s: char;
}

let sorted_cards () =
  let cards = Array.make 52 {s=' ';r=' '} in
  List.iteri (fun i s -> 
               List.iteri (fun j r ->
                            cards.(i*13+j) <- {s;r}
                          ) ['A'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'T'; 'J'; 'Q'; 'K']
             ) ['C'; 'D'; 'H'; 'S'];
  cards

let () =
  let cards = sorted_cards () in
  let swap i j =
    let c = cards.(i) in
    cards.(i) <- cards.(j);
    cards.(j) <- c in
  for i = 0 to 51 do
    Scanf.scanf "%d " (fun j -> swap i (j mod 52))
  done;
  Array.iter (fun {r;s} -> Printf.printf "%c%c " s r) cards