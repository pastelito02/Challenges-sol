--Author memstick
assert(#arg>2)
local nt = tonumber(arg[1])
assert(#arg>=(nt+1))

local suit = {'Clubs', 'Spades', 'Diamonds', 'Hearts'}
local rank = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}

local i=2
for n=1,nt do
    io.write(string.format("%s-of-%s ", rank[arg[i]%13 +1], suit[arg[i]//13 +1]))
    i = i + 1
end
print()