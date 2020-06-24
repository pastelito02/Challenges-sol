--Author memstick
assert(#arg>2)
local nt = tonumber(arg[1])
assert(#arg>=(5*nt+1))

local i=2
for tc=1,nt do
    local a,c,m,x0,n = tonumber(arg[i]),tonumber(arg[i+1]),tonumber(arg[i+2]),tonumber(arg[i+3]),tonumber(arg[i+4])
    local x = x0
    for i=1,n do
        x = (a*x+c)%m
    end
    io.write(string.format("%d ", x))
    i = i+5
end
print()