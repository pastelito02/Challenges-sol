--Author memstick
assert(#arg>51)

local suits = {"C","D","H","S"}
local rank = {"A","2","3","4","5","6","7","8","9","T","J","Q","K"}
local deck = {}
for s=1,#suits do
    for r=1,#rank do
        deck[#deck+1] = suits[s]..rank[r]
    end
end

for i=1,#arg do
    local j = tonumber(arg[i]) % 52 + 1
    deck[i], deck[j] = deck[j], deck[i]
end

for _,v in ipairs(deck) do
    io.write(v, " ")
end
print()