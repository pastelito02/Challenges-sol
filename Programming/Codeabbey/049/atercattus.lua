--Author atercattus
cnt = io.read('*n')
io.read('*line')

local matches = {
    RS =  1, SP  = 1, PR  = 1,
    SR = -1, PS = -1, RP = -1
}

for cnt = cnt, 1, -1 do
    local str = io.read('*line')

    local p1, p2 = 0, 0

    for s in str:gmatch('([SPR]+)') do
        p1 = p1 + (matches[s] or 0)
        p2 = p2 - (matches[s] or 0)
    end

    io.write(p1 > p2 and 1 or 2, ' ')
end