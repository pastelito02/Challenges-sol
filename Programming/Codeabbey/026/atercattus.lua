--Author atercattus
local function GCD(a, b)
    while a ~= b and a ~= 0 and b ~= 0 do
        if a > b then
            a = a % b
        else
            b = b % a
        end
    end

    return math.max(a, b)
end

for cnt = io.read('*n'), 1, -1 do
    local a, b = io.read('*n'), io.read('*n')
    local gcd = GCD(a, b)
    local lcm = a * b / gcd
    io.write(string.format('(%d %d) ', gcd, lcm))
end