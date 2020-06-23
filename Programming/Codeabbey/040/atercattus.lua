--Author atercattus
local H, W = io.read('*n'), io.read('*n'), io.read('*l')

local map, from, to = {}, nil, nil
for r = 1, H do
    local c = 0
    map[r] = {}
    for ch in io.read('*l'):gmatch('[@+X$]') do
        c = c + 1

        local pass = true

        if ch == '@' then
            from = {r, c}
        elseif ch == '$' then
            to = {r, c}
        else
            pass = ch == '+'
        end

        map[r][c] = pass
    end
end

local function count_patches(r, c)
    if r > H or c > W then
        return 0
    elseif r == to[1] and c == to[2] then
        return 1
    elseif not map[r][c] then
        return 0
    else
        return count_patches(r, c + 1) + count_patches(r + 1, c)
    end
end

print(count_patches(from[1], from[2]))