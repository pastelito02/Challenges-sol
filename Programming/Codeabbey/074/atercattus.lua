--Author atercattus
local function coords(grad, scale)
  return math.sin(math.rad(grad)) * scale + 10,
         math.cos(math.rad(grad)) * scale + 10
end

io.read('*l')
for H, M in io.read('*l'):gmatch('(%d+):(%d+)') do
  local _M = M / 60
  local _H = ((H % 12) + _M) / 12

  local Hx, Hy = coords(_H * 360, 6)
  local Mx, My = coords(_M * 360, 9)
  io.write(string.format('%.8f %.8f %.8f %.8f', Hx, Hy, Mx, My), ' ')
end
