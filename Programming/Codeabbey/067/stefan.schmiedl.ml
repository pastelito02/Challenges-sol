(*Author stefan.schmiedl*)
open Big_int

let fibo_index str =
  let bn = big_int_of_string str in
  let rec loop i ba bb =
    if (eq_big_int bn ba)
    then i
    else loop (i+1) bb (add_big_int ba bb) in
  loop 0 zero_big_int unit_big_int

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%s@\n" fibo_index |> Printf.printf "%d "
                      done)
