--Author WyattMarks
io.stdout:setvbuf("no")
print('')

local input = io.read()
input = io.read()

local running = true
local array = {}
while running do
    local space = input:find(" ")
    local current = input
    if space then
        current = input:sub(1, space)
    end

    array[#array+1] = tonumber(current)
    
    
    if space then
        input = input:sub(space + 1)
    else
        running = false
    end
end

local function makeString(value)
    local str = tostring(value)
    local dif = 8 - #str
    for i=1,dif do
        str = '0'..str
    end
    
    return str:sub(3,6)
end

local function contain(value, tbl)
    for k,v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    
    return false
end

local answer = ''

for i=1, #array do
    local iterations = 0
    local value = array[i]
    local used = {}

    while not contain(value,used) do
        used[#used+1] = value
        value = tonumber(makeString(value^2))
        iterations = iterations + 1
    end
    
    answer = answer..tostring(iterations).." "
end

print(answer)