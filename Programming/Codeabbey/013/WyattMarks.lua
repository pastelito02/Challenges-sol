--Author WyattMarks
io.stdout:setvbuf("no")
print('')

local input = io.read()

local function invalidInput()
  print("Invalid input")
  error()
end

local amount = tonumber(input)

if not amount then invalidInput() end

local answer = ''
input = io.read()

for i=1, amount do
  local space = input:find(' ')
  local first = input
  if space then
    first = tonumber(input:sub(1,space))
    input = input:sub(space+1)
  else
    first = tonumber(first)
  end

  first = tostring(first)
  local wsd = 0

  for j=1, #first do
    wsd = wsd + j * tonumber(first:sub(j,j))
  end


  answer = answer .. tostring(wsd) .. " "
end

print(answer)
