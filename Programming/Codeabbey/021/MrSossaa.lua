--Author MrSossaa
local case = io.read("*number")
local case2 = io.read("*number")
local result = {}
for i = 0, case2 do
  result[i] = 0
end
local c = 0
while c < case do
  c = c +1
  local types = io.read("*number")
  for i = 1, case2 do
    if types == i  then
      result[i] = result[i]+1
    end
  end
end
for i = 1, case2 do
  print(result[i])
end
