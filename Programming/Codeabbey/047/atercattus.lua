--Author atercattus
local cnt, K = io.read('*n'), io.read('*n')
io.read('*line')

local ordA, ordZ = string.byte('A'), string.byte('Z')
for cnt = cnt, 1, -1 do
    local str = io.read('*line')
    local res = {}
    for i = 1, #str do
        local ch = str:byte(i)
        if ch >= ordA and ch <= ordZ then
            ch = ch - ordA - K
            if ch < 0 then
                ch = ch + 26
            end
            ch = ch + ordA
        end
        res[i] = string.char(ch)
    end
    io.write(table.concat(res), ' ')
end