--Author ayy_luamao
function print_grid()
    for i=1,#grid do
        for j=1,#grid[i] do
            io.write(grid[i][j])
        end
        io.write("\n")
    end
    io.write("\n")
end

function step()
    --simulate 1 step of the life game, return updated number of live cells
    --using the naive 2-array approach
    
    --create empty grid of same size
    local tmp_grid = {}
    for i=1,#grid do
        local row = {}
        for j=1,#grid[i] do
            row[j] = '-'
        end
        tmp_grid[i] = row
    end
    
    local live_count = 0
    
    for i=2,#grid-1 do
        for j=2,#grid[i]-1 do
            local live = 0
            --above row
            for k=-1,1 do
                if grid[i-1][j+k] == 'X' then
                    live = live + 1
                end
            end
            --this row
            if grid[i][j-1] == 'X' then
                live = live + 1
            end
            if grid[i][j+1] == 'X' then
                live = live + 1
            end
            --below row
            for k=-1,1 do
                if grid[i+1][j+k] == 'X' then
                    live = live + 1
                end
            end
            
            --apply result to tmp_grid
            if live == 2 then --no change
                tmp_grid[i][j] = grid[i][j]
            elseif live == 3 then --born or stays live
                tmp_grid[i][j] = 'X'
            end
               
            --count if live
            if tmp_grid[i][j] == 'X' then
                live_count = live_count + 1
            end
        end
    end
    --copy results back to main grid
    for i=1,#grid do
        local row = {}
        for j=1,#grid[i] do
            row[j] = tmp_grid[i][j]
        end
        grid[i] = row
    end
    
    io.write(live_count, " ")
end

f = assert(io.open("abbey_056.txt", "r"))

io.write("input data:\n")

ROWS = 5
COLS = 7

--read in initial grid, padded with large margins of dead cells
grid = {}
for i=1,10 do
    local row = {}
    for j=1,(10 + COLS + 10) do
        row[j] = '-'
    end
    grid[i] = row
end
for i=11,(10+ROWS) do
    local line = f:read("*line")
    io.write(line, "\n")
    
    local row = {}
    for j=1,10 do
        row[j] = '-'
    end
    for j=11,(10+COLS) do
        row[j] = line:sub(j-10,j-10)
    end
    for j=(11+COLS),(10+COLS+10) do
        row[j] = '-'
    end
    grid[i] = row
end
for i=(11+ROWS),(10+ROWS+10) do
    local row = {}
    for j=1,(10 + COLS + 10) do
        row[j] = '-'
    end
    grid[i] = row
end

answers = {}

io.write("\nanswer:\n")

for i=1,5 do
    step()
end
io.write("\n")