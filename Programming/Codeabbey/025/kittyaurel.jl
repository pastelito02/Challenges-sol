#Author kittyaurel
f = open("codeabbey/input.txt")
lines = readlines(f)
records = parse(Int64, lines[1])
results = []

function lcg(a, c, m, x₀, n)
    next = (a * x₀ + c) % m

    for i = 1:n-1
        next = (a * next + c) % m
    end

    return next
end

for i = 2:records+1
    input = [parse(Int64, x) for x = split(lines[i], " ")]
    push!(results, lcg(input[1], input[2], input[3], input[4], input[5]))
end

for r = results
    print(r, " ")
end