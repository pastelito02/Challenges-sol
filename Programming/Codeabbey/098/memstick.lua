--Author memstick
require("round")
assert(#arg>2)
assert(arg[1]=="Stand at the pole with the plaque START")
assert(arg[#arg]=="Dig here!")

local cos, sin = math.cos, math.sin

local pos = {0, 0}
for i=2,#arg-1 do
    local dir = {}
    for num in arg[i]:gmatch("%d+") do
        dir[#dir+1] = tonumber(num)
    end
    assert(#dir==2)
    dir[2] = math.rad((dir[2]+90)%360)

    pos[1] = pos[1] - dir[1]*cos(dir[2])
    pos[2] = pos[2] + dir[1]*sin(dir[2])
end
io.write(math.round(pos[1]), " ", math.round(pos[2]), "\n")
