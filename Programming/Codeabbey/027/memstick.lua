--Author memstick
assert(#arg>1)

local arr = {}
for i=2,#arg do
    arr[#arr+1] = tonumber(arg[i])
end

local npass, nswap, totalswap = 0, 0,0
repeat
    nswap = 0
    for i=2,#arr do
        if arr[i-1]>arr[i] then
            arr[i],arr[i-1] = arr[i-1],arr[i]
            nswap = nswap + 1
        end
    end
    totalswap = totalswap + nswap
    npass = npass + 1
until nswap==0
io.write(npass, " ", totalswap, "\n")