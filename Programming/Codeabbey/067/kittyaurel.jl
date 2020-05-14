#Author kittyaurel
file = open("codeabbey/input.txt")
lines = readlines(file)
records = parse(Int64, lines[1])
results = []

#=

 f(0) = 0
 f(1) = 1
 f(n) = f(n-1) + f(n-2)

 f(n) = r^n
 => r^2-r-1 = 0
 => r1 = Φ; r2 = Ψ

 f(n) = a*Φ^n+b*Ψ^n
 => solve linear system

=#

rt5 = sqrt(5)
Φ = (1+rt5)/2
Ψ = (1-rt5)/2
fib(n) = BigInt(trunc((Φ^n-Ψ^n)/rt5))

function solve_equation(f, c, range)
  left, right = minimum(range), maximum(range)

  while right-left >= 1
    middle = (left+right)/2
    value = f(round(middle))
    if c < value
      right = middle
    elseif c > value
      left = middle
    else
      break
    end
  end

  entry = floor((left+right)/2)

  while f(entry) < c
    entry += 1
  end

  return Int64(entry)
end

for i = 2:records+1
  input = parse(BigInt, lines[i])
  push!(results, solve_equation(fib, input, 0:1000))
end

for r = results
  print(r, " ")
end
