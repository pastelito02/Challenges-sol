(*Author stefan.schmiedl*)
let bmi w h = w /. h /. h

let classify = function
  | bmi when bmi < 18.5 -> "under"
  | bmi when bmi < 25.0 -> "normal"
  | bmi when bmi < 30.0 -> "over"
  | _ -> "obese"

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%f %f " bmi |> classify |> Printf.printf "%s "
                      done)