--Author memstick
require("round")
assert(#arg>2)
local nt = tonumber(arg[1])
assert(#arg>=(2*nt+1))

local i=2
for tc=1,nt do
  local n,k = tonumber(arg[i]), tonumber(arg[i+1])
  local Cnk = (function(n,k)
    local prod = 1
    for j=1,k do
      prod = prod * (n-j+1) / j
    end
    return prod
  end)(n,k)
  io.write(string.format("%d ", math.round(Cnk)))
  i = i + 2
end
print()
