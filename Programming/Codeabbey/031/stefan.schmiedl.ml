(*Author stefan.schmiedl*)
let rec rotate_left bs = function
  | 0 -> Bytes.to_string bs
  | n -> let a = Bytes.get bs 0 in
    for i = 0 to Bytes.length bs - 2 do
      Bytes.set bs i (Bytes.get bs (i+1))
    done;
    Bytes.set bs (Bytes.length bs - 1) a;
    rotate_left bs (n-1)

let rec rotate_right bs = function
  | 0 -> Bytes.to_string bs
  | n -> let a = Bytes.get bs (Bytes.length bs - 1) in
    for i = Bytes.length bs - 1 downto 1 do
      Bytes.set bs i (Bytes.get bs (i-1))
    done;
    Bytes.set bs 0 a;
    rotate_right bs (n-1)


let rotate n str =
  if n >= 0
  then rotate_left (Bytes.of_string str) n
  else rotate_right (Bytes.of_string str) (-n)

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d %s@\n" rotate |> Printf.printf "%s "
                      done)
