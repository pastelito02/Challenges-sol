--Author ayy_luamao
f = assert(io.open("abbey_012.txt", "r"))

lines = f:read("*number")

io.write("input data:\n", lines, "\n")

answers = {}

for i=1,lines do
    
    times = {}
    for j=1,2 do
        local d = f:read("*number")
        local h = f:read("*number")
        local m = f:read("*number")
        local s = f:read("*number")
        
        io.write(d, " ", h, " ", m, " ", s, " ")
        
        times[j] = d * 86400 + h * 3600 + m * 60 + s
    end
        
    local diff = times[2] - times[1]
    local d = math.floor(diff / 86400)
    diff = diff % 86400
    local h = math.floor(diff / 3600)
    diff = diff % 3600
    local m = math.floor(diff / 60)
    diff = diff % 60
    local s = diff

    answers[i] = "(" .. d .. " " .. h .. " " .. m .. " " .. s .. ")"
    io.write("\n")
end

io.write("\nanswer:\n")

for i=1,lines do
    io.write(answers[i], " ")
end

io.write("\n")