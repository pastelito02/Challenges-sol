--Author WyattMarks
io.stdout:setvbuf("no")
print('')

local input = io.read()

local amount = tonumber(input)

local answer = ''


for i=1, amount do
  input = io.read()
  local space = input:find(' ')
  local distance = tonumber(input:sub(1,space))
  input = input:sub(space+1)
  space = input:find(" ")
  local firstSpeed = tonumber(input:sub(1,space))
  local secondSpeed = tonumber(input:sub(space))

  local meet = (distance / (firstSpeed + secondSpeed)) * firstSpeed

  answer = answer .. tostring(meet) .. " "
end

print(answer)
