--Author atercattus
local wins = {
'111000000',
'000111000',
'000000111',

'100100100',
'010010010',
'001001001',

'100010001',
'001010100',
}

for k,i in ipairs(wins) do
    wins[k] = tonumber(i, 2)
end

for cnt = io.read('*n'), 1, -1 do
    local desks = {0, 0}
    local found = false
    for i = 1, 9 do
        local p = io.read('*n') - 1
        local idx = (i-1) % 2 + 1
        desks[idx] = bit.bor(desks[idx], bit.lshift(1, p))

        for _,win in ipairs(wins) do
            if bit.band(desks[idx], win) == win then
                io.write(i)
                io.read('*line') -- довычитка оставшихся чисел в строке
                found = true
                break
            end
        end

        if found then
            break
        end
    end

    if not found then
        io.write('0')
    end
    io.write(' ')
end