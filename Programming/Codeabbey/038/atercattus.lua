--Author atercattus
local results = {}
for cnt = io.read('*n'), 1, -1 do
    local A, B, C = io.read('*n'), io.read('*n'), io.read('*n')

    local s = B*B - 4*A*C
    local im = s < 0
    if im then
        s = -s
    end
    local S2A = math.sqrt(s) / (2 * A)
    local B2A = (B == 0) and 0 or -B / (2 * A)

    local x1, x2

    if not im then
        x1 = B2A + S2A
        x2 = B2A - S2A

        if x1 < x2 then
            x1, x2 = x2, x1
        end
    else
        x1 = string.format('%d%+di', B2A, S2A)
        x2 = string.format('%d%+di', B2A, -S2A)
    end

    table.insert(results, x1..' '..x2)
end

print(table.concat(results, '; '))