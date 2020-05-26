--Author memstick
assert(#arg>2)

local seen = {}
local seenMulti = {}

for i=1,#arg-1 do
    if seen[arg[i]]==nil then
        seen[arg[i]] = 1
    else
        if seen[arg[i]]==1 then
            seenMulti[#seenMulti+1] = arg[i]
        end
        seen[arg[i]] = seen[arg[i]] + 1
    end
end

table.sort(seenMulti, function(a,b)
    for i=1,3 do
        local ai,bi = a:byte(i),b:byte(i)
        if ai~=bi then
            return ai<bi
        end
    end
    return false
end)

for _,w in ipairs(seenMulti) do
    io.write(w, " ")
end
print()
