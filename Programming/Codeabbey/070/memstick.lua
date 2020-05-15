--Author memstick
assert(#arg>0)
local x0 = tonumber(arg[1])

function NewLcg (a, c, m, x0)
    assert(x0~=nil and m ~=nil and c~=nil and a~=nil)
    local lcg = {
        a = a,
        c = c,
        m = m,
        x = x0
    }
    setmetatable(lcg, {
        __call = function ()
            lcg.x = (lcg.a * lcg.x + lcg.c) % lcg.m
            return lcg.x
        end
    })
    return lcg
end

local letter = {
    {'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'r', 's', 't', 'v', 'w', 'x', 'z'},
    {'a', 'e', 'i', 'o', 'u'}
}

local lcg = NewLcg(445, 700001, 2097152, x0)

local seen = {}
local mostFrequentWord = 0

for w=1,900000 do
    local word = {}
    local letterType = 0

    for j=1,6 do
        local idx = lcg() % (#letter[letterType+1]) + 1
        word[#word+1] = letter[letterType+1][idx]
        letterType = (letterType+1)%2
    end

    word = table.concat(word)
    if seen[word] == nil then
        seen[word] = 1
    else
        seen[word] = seen[word] + 1
        if mostFrequentWord == 0 or seen[word] > seen[mostFrequentWord] then
            mostFrequentWord = word
        end
    end
end
print(mostFrequentWord)