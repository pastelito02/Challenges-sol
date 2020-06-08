#Author kittyaurel
f = open("codeabbey/input.txt")
lines = readlines(f)
records = parse(Int64, lines[1])

function bubblesort(arr)
    passes, swaps, swsum = 0, 0, 0
    running = true

    while swaps != 0 || passes == 0
        swaps = 0
        for i = 2:length(arr)
            if(arr[i] < arr[i-1])
                dum = arr[i]
                arr[i] = arr[i-1]
                arr[i-1] = dum
                swaps += 1
            end
        end
        passes += 1
        swsum += swaps
    end

    return passes, swsum
end

inputs = [parse(Int64, x) for x = split(lines[2], " ")]
results = bubblesort(inputs)

print(results[1], " ", results[2])