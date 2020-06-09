--Author memstick
assert(#arg>2)
local nt = tonumber(arg[1])
assert(#arg>=(nt+1))

local i=2
for tc=1,nt do
    local aces = 0
    local points = 0
    for c in string.gmatch(arg[i], "([^ ]+)") do
        if c == "A" then
            aces = aces + 1
            points = points + 1
        elseif string.match(c, "([%d]+)") ~= nil then
            points = points + tonumber(c)
        else
            points = points + 10
        end
    end
    while aces>0 and (21-points)>=10 do
        points = points + 10
        aces = aces - 1
    end
    
    if points<=21 then
        io.write(string.format("%d ", points))
    else
        io.write(string.format("Bust "))
    end
    i = i + 1
end
print()