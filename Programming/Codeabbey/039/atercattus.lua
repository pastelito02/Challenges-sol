--Author atercattus
local function standard_deviation(list)
  if #list < 2 then
    return 0
  end

  local avg = 0
  for _,i in ipairs(list) do
    avg = avg + i
  end
  avg = avg / #list

  local distances = {}
  for _,i in ipairs(list) do
    table.insert(distances, math.pow(avg - i, 2))
  end

  local m = 0
  for _,i in ipairs(distances) do
    m = m + i
  end
  m = math.sqrt(m / #distances)

  return m, avg
end

local cnt = io.read('*n'), io.read('*line')
for cnt = cnt, 1, -1 do
  local name = io.read(4)
  local prices = {}
  for i = 1, 14 do
    table.insert(prices, io.read('*n'))
  end
  io.read('*line')

  local m, avg = standard_deviation(prices)

  if m / (avg * 0.01) >= 4 then
    io.write(name, ' ')
  end
end
