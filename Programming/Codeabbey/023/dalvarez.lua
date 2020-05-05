--Author dalvarez
require 'io'
local swaps = 0
local data = nil
local source = "793 66 53 99 160 33247 78 24527 6934 31 1 2 2023 22 9181 2015 9371 98179 373 9 995 92 305 5 4703 8569 8464 3 4 701 21 6281 8 6 1 668 7 892 -1"
function split(s, delimiter)
  result = {};
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    table.insert(result, match);
  end
  return result;
end
for line in source do
  data = line
end
newData = split(data," ")
len = 0
for Index, Value in pairs( newData ) do
  len = len + 1
end
for i = 1, len-1, 1
do
  if tonumber(newData[i]) > tonumber(newData[i + 1]) and newData[i + 1] ~= newData[len] then
    swaps = swaps + 1
    n = newData[i + 1]
    newData[i + 1] = newData[i]
    newData[i] = n
  end
end
function checksum(l, limit, seed)
  result = 0
  for i = 1, len-1 do
    result = (result + tonumber(newData[i])) * seed
    if result > limit then
      result = result % limit
    end
  end
   return result
end
limit = 10000007
seed = 113
io.write(swaps, " ", checksum(newData,limit, seed))
