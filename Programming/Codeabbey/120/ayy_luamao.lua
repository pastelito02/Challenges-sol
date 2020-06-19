--Author ayy_luamao
f = assert(io.open("abbey_120.txt", "r"))

nums = f:read("*number")

io.write("input data:\n", nums, "\n")

array = {}

for i=1,nums do
    local n = f:read("*number")
    io.write(n, " ")
    array[i] = n
end
io.write("\n")

maximums = {}

array_len = #array

while array_len > 1 do

    local largest = array[1]
    local largest_index = 1
    
    for i=2,array_len do
        if array[i] > largest then
            largest = array[i]
            largest_index = i
        end
    end
    --perform swap
    local tmp = array[array_len]
    array[array_len] = largest
    array[largest_index] = tmp
    
    --store index of maximum element
    table.insert(maximums, largest_index-1)
    array_len = array_len - 1
end

io.write("\nanswer:\n")
for i=1,#maximums do
    io.write(maximums[i], " ")
end
io.write("\n")
