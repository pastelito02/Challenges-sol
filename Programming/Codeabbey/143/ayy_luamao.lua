--Author ayy_luamao
f = assert(io.open("abbey_143.txt", "r"))

lines = f:read("*line")
io.write("input data:\n", lines, "\n")

answers = {}

for i=1,lines do
    local num1 = f:read("*number")
    local num2 = f:read("*number")
    io.write(num1, " ", num2, "\n")
    
    local x = num1
    local y = num2
    
    local s_prev = 1
    local s_curr = 0
    local s_next = nil
    local t_prev = 0
    local t_curr = 1
    local t_next = nil
    
    local quotient = nil
    local remain = nil
    
    while true do
        quotient = math.floor(num1 / num2)
        remain = num1 % num2
        
        if remain == 0 then
            break
        else
            s_next = s_prev - quotient * s_curr
            t_next = t_prev - quotient * t_curr
        
            num1 = num2
            num2 = remain
            
            s_prev = s_curr
            s_curr = s_next
            t_prev = t_curr
            t_curr = t_next
        end
    end
    
    answers[i] = (s_curr * x + t_curr * y) .. " " .. s_curr .. " " .. t_curr
end

io.write("\nanswer:\n")
for i=1, #answers do
    io.write(answers[i], " ")
end
io.write("\n")