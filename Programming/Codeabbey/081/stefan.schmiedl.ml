(*Author stefan.schmiedl*)
let count_bits_32 n =
  let rec loop i = function
    | 0 -> i
    | n -> loop (if n land 1 = 1 then i+1 else i) (n lsr 1) in
  loop 0 (n land 0xFFFF_FFFF)

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d " count_bits_32 |> Printf.printf "%d "
                      done)
