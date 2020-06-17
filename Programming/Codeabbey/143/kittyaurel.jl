#Author kittyaurel
f = open("input.txt")
lines = readlines(f)
records = parse(Int64, lines[1])
results = []

function ecagcd(X, Y)
    x, y = X, Y
    q, r = divrem(x,y)
    sprev, scur = 1, 0
    tprev, tcur = 0, 1
    while r != 0
        dum = scur
        scur = sprev - q*scur
        sprev = dum
        dum = tcur
        tcur = tprev - q*tcur
        tprev = dum
        x, y = y, r
        q, r = divrem(x,y)
    end
    return (X*scur+Y*tcur, scur, tcur)
end

for i = 2:records+1
    inputs = [parse(Int64, x) for x = split(lines[i], " ")]
    for r = ecagcd(inputs[1], inputs[2])
        push!(results, r)
    end
end

for r = results
    print(r, " ")
end
print("\n")