--Author ayy_luamao
function pathfind(x, y, dist)
    --populate a 2d array labeling distances from start point
    --stopping when destination is reached, using an a* like algorithm
    
    if finished then --goal has been reached already
        return
    elseif x == 1 and y == 1 then --this space is the goal
        counts[y][x] = dist
        finished = true
        return
    elseif counts[y][x] > 1 then --this space already visited
        return
    else
        if counts[y][x] == 0 then --not yet visited
            counts[y][x] = dist
        end

        --find available moves from here
        local moves = {}
        local mv_index = 1
         --check left
        if (x-1) >= 1 and maze[y][x-1] == 1 and counts[y][x-1] == 0 then
            --find Manhattan distance to goal (1,1)
            local d = math.abs(y - 1) + math.abs((x - 1) - 1)
            moves[mv_index] = {"left", d}
            mv_index = mv_index + 1
        end
        --check right
        if (x+1) <= cols and maze[y][x+1] == 1 and counts[y][x+1] == 0 then
            local d = math.abs(y - 1) + math.abs((x + 1) - 1)
            moves[mv_index] = {"right", d}
            mv_index = mv_index + 1
        end
        --check up
        if (y-1) >= 1 and maze[y-1][x] == 1 and counts[y-1][x] == 0 then
            local d = math.abs((y - 1) - 1) + math.abs(x - 1)
            moves[mv_index] = {"up", d}
            mv_index = mv_index + 1
        end
        --check down
        if (y+1) <= rows and maze[y+1][x] == 1 and counts[y+1][x] == 0 then
            local d = math.abs((y + 1) - 1) + math.abs(x - 1)
            moves[mv_index] = {"down", d}
        end
        
        --sort moves by distance from goal
        table.sort(moves, function(a, b) return a[2] < b[2] end)
        
        for i,v in ipairs(moves) do
            if v[1] == "left" then
                pathfind(x-1, y, dist+1)
            elseif v[1] == "right" then
                pathfind(x+1, y, dist+1)
            elseif v[1] == "up" then
                pathfind(x, y-1, dist+1)
            else
                pathfind(x, y+1, dist+1)
            end
        end
    end
end

function backtrack(x, y, dist, startx, starty)
    --backtrack from the goal to the starting position, using previously
    --generated array of distances as a guide
    --populate string of moves from start position to goal

    if x == startx and y == starty then --start reached
        return
    else --check surrounding distances
        if (x-1) >= 1 and counts[y][x-1] == (dist - 1) then --left
            path = 'R' .. path
            backtrack(x-1, y, dist-1, startx, starty)
        elseif (x+1) <= cols and counts[y][x+1] == (dist - 1) then --right
            path = 'L' .. path
            backtrack(x+1, y, dist-1, startx, starty)
        elseif (y-1) >= 1 and counts[y-1][x] == (dist - 1) then --up
            path = 'D' .. path
            backtrack(x, y-1, dist-1, startx, starty)
        elseif (y+1) <= rows and counts[y+1][x] == (dist - 1) then --down
            path = 'U' .. path
            backtrack(x, y+1, dist-1, startx, starty)
        end
    end
end

f = assert(io.open("abbey_064.txt", "r"))

cols, rows = f:read("*number"), f:read("*number")

io.write("input data:\n", cols, " ", rows, "\n")

f:read(1) --consume newline

--populate maze array
maze = {}
for i=1,rows do
    local line = f:read("*line")
    io.write(line, "\n")
    local r = {}
    for j=1,cols do
        r[j] = tonumber(line:sub(j,j))
    end
    maze[i] = r
end

io.write("\nanswer:\n")

start_locs = {{1, cols}, {rows, 1}, {rows, cols}}

for i=1,3 do
    local starty = start_locs[i][1]
    local startx = start_locs[i][2]

    --0 = unvisited space, -1 = starting position
    counts = {}
    for i=1,#maze do
        local r = {}
        for j=1,#maze[1] do
            if i == starty and j == startx then
                r[j] = 1
            else
                r[j] = 0
            end
        end
        counts[i] = r
    end

    finished = false

    --find shortest path to goal
    pathfind(startx, starty, 1)
    
    path = ""
    --find path from start to goal
    backtrack(1, 1, counts[1][1], startx, starty)
    
    --run-length compress path
    local out = ""
    local run = 1
    local last = path:sub(1,1)
    for i=2,#path do
        if path:sub(i,i) == last then
            run = run + 1
        else
            out = out .. run .. last
            run = 1
        end
        last = path:sub(i,i)
    end
    out = out .. run .. last
    
    io.write(out, " ")
end
io.write("\n")