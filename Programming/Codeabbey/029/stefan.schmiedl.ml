(*Author stefan.schmiedl*)
let () =
  let data = Scanf.scanf "%d " (fun n -> Array.init n 
                                           (fun i -> Scanf.scanf "%d " (fun n -> (n,i)))) in
  Array.sort (fun (a,i) (b,j) -> compare a b) data;
  Array.iter (fun (a,i) -> Printf.printf "%d " (i+1)) data