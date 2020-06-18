--Author WyattMarks
io.stdout:setvbuf("no")
print('')

local input = io.read()
input = io.read()

local function round(n)
    local str = tostring(n)
    local shouldRound = tonumber( str:sub(-2) ) >= 50
    if #str > 8 then
        if shouldRound then
            str = str:sub(1, #str-2)
            local last = tonumber(str:sub(-1)) + 1
            str = str:sub(1,#str-1) .. tostring(last)
        else
            str = str:sub(1, #str-2)
        end
    end
    
    if n == math.floor(n) then
        --str = str .. ".0"
    end
    
    return str
end

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

answer = round(array[1]) .. " "

for i=2, #array-1 do
    
    answer = answer .. round((array[i-1] + array[i] + array[i+1]) / 3) .. " "
end

answer = answer .. round(array[#array])

print(answer)