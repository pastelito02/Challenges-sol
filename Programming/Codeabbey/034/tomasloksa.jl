#Author tomasloksa
f = open("input.txt")
count = parse(Int, readline(f))
for i = 1:count
  A, B, C, D = parse.(Float64, split(readline(f)))
  x = 50.0
  change = 25.0
  while change >= 1e-8
    temp = A * x + B * sqrt(x ^ 3) - C * exp(-x / 50) - D
    if temp < 0
      x += change
    elseif temp > 0
      x -= change
    else
      break
    end
    change /= 2
  end
  print(x, " ")
end
