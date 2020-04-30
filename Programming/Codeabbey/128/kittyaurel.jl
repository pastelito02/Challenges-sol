#Author kittyaurel
f = open("codeabbey/input.txt")
lines = readlines(f)
records = parse(Int64, lines[1])
results = []

function nCr(n, k)
  if n-k <= 20
    return BigInt(prod(k+1:n)/factorial(n-k))
  else
    return BigInt(prod(n-k+1:n)/factorial(k))
  end
end

for i = 2:records+1
  inputs = [parse(BigInt, x) for x = split(lines[i], " ")]
  push!(results, nCr(inputs[1], inputs[2]))
end

for r = results
  print(r, " ")
end
