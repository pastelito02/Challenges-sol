#matraven
proc subtractSum*(n: int): string =
  discard # fruit name like "apple"
  var a = 0

  for i in $(n):

    a += int(i)-48

  var m = n-a

  if m in [9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99]:
      return "apple"

  else:
      return subtractSum(m)
