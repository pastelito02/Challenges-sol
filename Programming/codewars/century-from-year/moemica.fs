let century year =
  match year % 100 with
  | 0 -> year / 100
  | _ -> year / 100 + 1
