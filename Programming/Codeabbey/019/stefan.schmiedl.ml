(*Author stefan.schmiedl*)
exception StackException of string

let pop_match c = function
  | [] -> raise (StackException "empty")
  | p::ps ->
    if p = (match c with
             | ')' -> '('
             | ']' -> '['
             | '}' -> '{'
             | '>' -> '<'
             | _ -> raise (StackException "invalid"))
    then ps
    else raise (StackException "overlap")

let balance str =
  let len = String.length str in
  let rec loop stack = function
    | n when n = len -> if List.length stack = 0 then 1 else 0
    | n -> let c = String.get str n in
      match c with
      | '(' | '[' | '{' | '<' -> loop (c::stack) (n+1)
      | ')' | ']' | '}' | '>' -> loop (pop_match c stack) (n+1)
      | _ -> loop stack (n+1) in
  try loop [] 0
  with StackException _ -> 0

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%s@\n" balance |> Printf.printf "%d "
                      done)
