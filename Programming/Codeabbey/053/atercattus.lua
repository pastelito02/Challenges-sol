--Author atercattus
local cnt = io.read('*n'), io.read('*line')
for cnt = cnt, 1, -1 do
    local kc, kn, _, qc, qn = io.read(1), io.read(1), io.read(1), io.read(1), io.read(1), io.read('*line')

    local function c2i(c) local a = 'a'; return c:byte(1) - a:byte(1) end

    local taken = kc == qc
                  or kn == qn
                  or math.abs(c2i(kc)-c2i(qc)) == math.abs(kn-qn)

    io.write(taken and 'Y' or 'N', ' ')
end