--Author ayy_luamao
function light_swap(digit_str)

    --convert to table
    local digits = {}
    for j=1,#digit_str do
        digits[j] = digit_str:sub(j,j)
    end
    
    local found = false
    local start = 0
    local index = nil
    local smallest = nil
    --until a swap that decreases the number can be found
    while not found do
        start = start + 1
        if start == #digits then
            break
        end
        --get rightmost smallest digit
        smallest = tonumber(digits[start], 16)
        index = start
        for j=#digits,start,-1 do
            if tonumber(digits[j], 16) < smallest then
                if (tonumber(digits[j], 16) > 0) or 
                (tonumber(digits[j], 16) == 0 and start > 1) then
                    smallest = tonumber(digits[j], 16)
                    index = j
                    found = true
                end
            end
        end
    end
    
    if found then
        --swap
        smallest = digits[index] --get original digit before hex conversion
        local tmp = digits[start]
        digits[start] = smallest
        digits[index] = tmp
    end
    
    return table.concat(digits, "")
end

function heavy_swap(digit_str)
    
    --convert to table
    local digits = {}
    for j=1,#digit_str do
        digits[j] = digit_str:sub(j,j)
    end

    local found = false
    local start = 0
    local index = nil
    local largest = nil
    --until a swap that increases the number can be found
    while not found do
        start = start + 1
        if start == #digits then
            break
        end
        --get rightmost largest digit
        largest = tonumber(digits[start], 16)
        index = start
        for j=#digits,start,-1 do
            if tonumber(digits[j], 16) > largest then
                largest = tonumber(digits[j], 16)
                index = j
                found = true
            end
        end
    end
    
    if found then
        --swap
        largest = digits[index] --get original digit before hex conversion
        local tmp = digits[start]
        digits[start] = largest
        digits[index] = tmp
    end
        
    return table.concat(digits, "")
end

f = assert(io.open("abbey_191.txt", "r"))

lines = f:read("*line")
io.write("input data:\n", lines, "\n")

answers = {}

for i=1,lines do
    local mass = f:read("*line")
    io.write(mass, "\n")
    
    answers[i] = light_swap(mass) .. " " .. heavy_swap(mass)
end

io.write("\nanswer:\n")
for i=1, #answers do
    io.write(answers[i], " ")
end
io.write("\n")