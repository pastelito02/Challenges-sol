(*Author stefan.schmiedl*)
let rep_ad_loop n =
  let rec loop seen n =
    if List.mem n seen
    then List.length seen
    else
      let n' = ((n*n) / 100) mod 10000 in
      loop (n::seen) n' in
  loop [] n

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d " rep_ad_loop |> Printf.printf "%d "
                      done)