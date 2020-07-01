--Author atercattus
local cnt, angle = io.read('*n'), io.read('*n'), io.read('*l')
local stars = {}
for cnt = cnt, 1, -1 do
    local name, x, y = io.read('*l'):gmatch('(.+)%s(.+)%s(.+)')()
    x, y = tonumber(x), tonumber(y)
    local r = math.sqrt(x*x + y*y)

    local a = math.deg(math.atan(y/x))
    if x < 0 then
        a = a + 180
    end

    a = math.rad(a + angle)

    x = math.floor(0.5 + r * math.cos(a))
    y = math.floor(0.5 + r * math.sin(a))

    table.insert(stars, {name, x, y})
end

table.sort(stars, function(a, b) return a[3] < b[3] or (a[3] == b[3] and a[2] < b[2]) end)

for _,star in ipairs(stars) do
    io.write(star[1], ' ')
end