--Author atercattus
for cnt = io.read('*n'), 1, -1 do
  local pA, pB = io.read('*n'), io.read('*n')

  pA, pB = pA/100, pB/100

  local p = pA / (1 - (1 - pA) * (1 - pB))
  io.write(math.floor(100 * p + 0.5), ' ')
end
