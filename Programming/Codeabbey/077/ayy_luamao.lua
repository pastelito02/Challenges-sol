--Author ayy_luamao
function sort_first(a, b)
    if a[1] < b[1] then
        return true
    else
        return false
    end
end

f = assert(io.open("abbey_077.txt", "r"))

lines = f:read("*line")
io.write("input data:\n", lines, "\n")

answers = {}

for i=1,lines do
    
    local x1 = f:read("*number")
    local y1 = f:read("*number")
    local x2 = f:read("*number")
    local y2 = f:read("*number")
    local xp = f:read("*number")
    local yp = f:read("*number")
    io.write(x1, " ", y1, " ", x2, " ", y2, " ", xp, " ", yp, "\n")
    
    local dist = {}
    for j=1,15 do --after 15 approximations (works with less too)
        dist = {}
        --distance between point and 1st endpoint
        local d1 = math.sqrt(math.pow((x1 - xp), 2) + math.pow((y1 - yp), 2))
        table.insert(dist, {d1, x1, y1})
        --distance between point and 2nd endpoint
        local d2 = math.sqrt(math.pow((x2 - xp), 2) + math.pow((y2 - yp), 2))
        table.insert(dist, {d2, x2, y2})
        --midpoint between endpoints
        local xm = (x1 + x2) / 2
        local ym = (y1 + y2) / 2
        --distance between point and midpoint
        local dm = math.sqrt(math.pow((xm - xp), 2) + math.pow((ym - yp), 2))
        table.insert(dist, {dm, xm, ym})
        --io.write(d1, " ", dm, " ", d2, "\n")
        
        --sort distances
        table.sort(dist, sort_first)
        
        --set 2 closest points as new endpoints
        x1, y1 = dist[1][2], dist[1][3]
        x2, y2 = dist[2][2], dist[2][3]
    end
    answers[i] = dist[1][1]
end

io.write("\nanswer:\n")

for i=1,#answers do
    io.write(answers[i], " ")
end
io.write("\n")