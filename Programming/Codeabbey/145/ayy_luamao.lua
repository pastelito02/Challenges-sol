--Author ayy_luamao
require "bit"
require "bc"

f = assert(io.open("abbey_145.txt", "r"))

nums = f:read("*number")

io.write("input data:\n", nums, "\n")

answers = {}

for i=1,nums do
    local a = tostring(f:read("*number"))
    local b = f:read("*number")
    local m = f:read("*number")
    io.write(a, " ", b, " ", m, "\n")
    
    local result = 1
    
    --based on code from Applied Cryptography by Bruce Schneier
    a = bc.number(a)
    --a = a % m
    a = bc.mod(a, m)
    
    while b > 0 do
        if b % 2 == 1 then
            result = (result * a) % m
        end

        b = bit.arshift(b, 1)

        a = bc.mul(a, a)
        a = bc.mod(a, m)
    end
    
    --otherwise write throws an error
    answers[i] = bc.tostring(result)
end

io.write("\nanswer:\n")

for i=1,nums do
    io.write(answers[i], " ")
end

io.write("\n")
