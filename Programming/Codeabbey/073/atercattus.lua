--Author atercattus
local c60, s60 = math.cos(math.rad(60)), math.sin(math.rad(60))
local offs = {
  ['A'] = {1, 0}, ['B'] = {c60, -s60}, ['C'] = {-c60, -s60}, ['D'] = {-1, 0}, ['E'] = {-c60, s60}, ['F'] = {c60, s60}
}

local cnt = io.read('*n'), io.read('*l')
for cnt = cnt, 1, -1 do
  local pos = {0, 0}
  for p in io.read('*l'):gmatch('([A-F])') do
    pos[1] = pos[1] + offs[p][1]
    pos[2] = pos[2] + offs[p][2]
  end
  io.write(string.format('%.8f', math.sqrt(pos[1]*pos[1] + pos[2]*pos[2])), ' ')
end
