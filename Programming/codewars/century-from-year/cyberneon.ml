let century (year: int): int =
  (* your code here *)
  if year mod 100 =0 then year/100 else year/100+1
;;
