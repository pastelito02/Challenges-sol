(*GrayJack*)
let positive_sum ls =
  ls |> List.filter (fun x -> x > 0) |> List.fold_left (+) 0
