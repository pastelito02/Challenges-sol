--Author atercattus
-- Lua have strict strings immutability
for cnt = io.read('*n'), 1, -1 do
    local shift, str = io.read('*n'), io.read('*line'):match('^%s*(.-)%s*$')
    if shift > 0 then
        shift = shift + 1
    end
    io.write(str:sub(shift)..str:sub(1, shift-1), ' ')
end