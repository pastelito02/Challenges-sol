--Author memstick
assert(#arg>2)

local width,height,len = tonumber(arg[1]),tonumber(arg[2]),tonumber(arg[3])

local pos = {0, 0}
local vel = {1, 1}
io.write(string.format("%d %d ", pos[1], pos[2]))

for step=1,100 do
  pos[1] = pos[1] + vel[1]
  pos[2] = pos[2] + vel[2]
  if pos[1]==0 then
    vel[1] = 1
  elseif pos[1]+len==width then
    vel[1] = -1
  end
  if pos[2]==0 then
    vel[2] = 1
  elseif pos[2]+1==height then
    vel[2] = -1
  end
  io.write(string.format("%d %d ", pos[1], pos[2]))
end
print()
