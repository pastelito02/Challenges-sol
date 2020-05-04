#Author hawkdove
inputs = [parse(Int64, x) for x in ARGS]

function weighteddigitsum(N)
  storedigits = []
  while N > 0
    digit = N % 10
    prepend!(storedigits, digit)
    N = fld(N, 10)
  end
  return sum([i * x for (i, x) in enumerate(storedigits)])
end

print.(weighteddigitsum.(inputs), " ")
