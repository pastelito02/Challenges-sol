--Author atercattus
local N, K = io.read('*n'), io.read('*n')

local humans = {}
for cnt = 1, N do
    humans[cnt] = true
end

local p, cnt, died = 1, 1, 0
while true do
    if humans[p] then
        if cnt == K then
            humans[p] = false
            cnt = 0
            died = died + 1
            if died == N - 1 then
                break
            end
        end
        cnt = cnt + 1
    end
    p = p + 1
    if p == N + 1 then
        p = 1
    end
end

for p,alive in pairs(humans) do
    if alive then
        print(p)
        break
    end
end