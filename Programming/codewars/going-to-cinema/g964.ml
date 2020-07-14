(*g964*)
let movie (card: int) (ticket: int) (perc: float): int =
  let rec helper (i: int) (sb: float) (sa: int) (prev: float): int =
    if (int_of_float(ceil sb) < sa) then i
    else
      let nou = prev *. perc in
        helper (i + 1) (sb +. nou) (sa + ticket) nou
  in
    helper 0 (float card) 0 (float ticket);;
