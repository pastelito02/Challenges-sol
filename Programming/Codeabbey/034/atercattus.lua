--Author atercattus
local epsilon = 1e-8

for cnt = io.read('*n'), 1, -1 do
  local A, B, C, D = io.read('*n'), io.read('*n'), io.read('*n'), io.read('*n')

  local xf, xt, x = 0, 100

  while true do
    x = (xf + xt)/2
    local f = A * x + B * math.sqrt(math.pow(x, 3)) - C * math.exp(-x / 50) - D
    if math.abs(f - 0) <= epsilon then
      break
    end

    if f > 0 then
      xt = x
    else
      xf = x
    end
  end

  io.write(x, ' ')
end
