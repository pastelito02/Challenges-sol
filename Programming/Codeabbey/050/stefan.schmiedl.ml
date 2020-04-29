(* Author stefan.schmiedl *)
let strip str =
  let b = Buffer.create (String.length str) in
  let is_char c =
    ('A' <= c && c <= 'Z') ||
    ('a' <= c && c <= 'z') in
  String.iter (fun c -> if is_char c then Buffer.add_char b (Char.lowercase c)) str;
  Buffer.contents b

let is_palindrome str =
  let rec loop l r =
    if r <= l
    then true
    else if String.get str l = String.get str r
    then loop (l+1) (r-1)
    else false in
  loop 0 (String.length str - 1)

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        let p = Scanf.scanf "%s@\n" strip |> is_palindrome in
                        Printf.printf "%c " (if p then 'Y' else 'N')
                      done)
