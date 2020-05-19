(*Author stefan.schmiedl*)
let decode k str =
  let a = int_of_char 'A' in
  String.map (fun c -> if 'A' <= c && c <= 'Z'
               then ((int_of_char c - a + 26 - k) mod 26) + a |> char_of_int
               else c) str

let () =
  Scanf.scanf "%d %d " (fun n k ->
                         for i = 0 to n - 1 do
                           Scanf.scanf "%s@\n" (decode k) |> Printf.printf "%s "
                         done)