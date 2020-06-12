--Author WyattMarks
io.stdout:setvbuf("no")
print('')

local input = io.read()
input = io.read()

local array = {}

local running = true
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

local indexes = {}
for i=1, #array do
    indexes[array[i]] = i
end

running = true
while running do
    running = false
    
    for i=1, #array do
        if array[i+1] and not (array[i] <= array[i+1]) then
            local t = array[i]
            array[i] = array[i+1]
            array[i+1] = t
            

            running = true
        end
    end
end

local answer = ''
for i=1, #array do
    answer = answer..tostring(indexes[array[i]]).." "
end

print(answer)