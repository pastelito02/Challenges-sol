(*Author stefan.schmiedl*)
let rank_name n =
  [|"2"; "3"; "4"; "5"; "6"; "7"; "8"; "9"; "10"; "Jack"; "Queen"; "King"; "Ace"|].(n)

let suite_name n =
  [|"Clubs"; "Spades"; "Diamonds"; "Hearts"|].(n)

let card_name n =
  let s = n / 13 in
  let r = n mod 13 in
  Printf.sprintf "%s-of-%s" (rank_name r) (suite_name s)

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d " card_name |> Printf.printf "%s "
                      done)