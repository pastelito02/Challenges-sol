#Author kittyaurel
f = open("codeabbey/input.txt")
lines = readlines(f)
results = []

rem_rand(big, min, max) = big%(max-min+1) + min

function generate_deck()
    ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K"]
    suits = ["C", "D", "H", "S"]

    return [suits[Int64(ceil(i/13))]*ranks[Int64(floor((i-1)%13))+1] for i = 1:52]
end

function shuffle(arr, rdvalues)
    for i = 1:length(arr)
        j = rem_rand(rdvalues[i], 1, 52)
        dum = arr[j]
        arr[j] = arr[i]
        arr[i] = dum
    end

    return arr
end

inputs = [parse(Int64, x) for x = split(lines[1], " ")]
results = shuffle(generate_deck(), inputs)

for r = results
    print(r, " ")
end