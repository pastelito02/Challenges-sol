--Author MrSossaa
local A = io.read("*number")
local sum = {}
for i = 0, A-1 do
  local b = 0
  local n
  local s = 1
  while not(n == 0) do
    n = io.read("*number")
    s = s+n
    b = b+1
  end
  s = s/(b-1)
  sum[i] = s
end
for i=0, A-1 do
  print(math.floor(sum[i]+0.5))
end
