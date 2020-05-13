--Author atercattus
require('BigNum')

for cnt = io.read('*n'), 1, -1 do
  local M = BigNum.new(io.read('*n'))

  local f, f0, f1, div, mod = BigNum.new(0), BigNum.new(0), BigNum.new(1), BigNum.new(0), BigNum.new(0)
  local i = 1
  while true do
    i = i + 1
    BigNum.add(f0, f1, f)

    BigNum.div(f, M, div, mod)

    if BigNum.mt.tostring(mod) == '0' then
      io.write(i, ' ')
      break
    end
    BigNum.copy(f1, f0)
    BigNum.copy(f, f1)
  end
end
