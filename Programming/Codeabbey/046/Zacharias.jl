#Author Zacharias
function ReadDataFile(fn::AbstractString)
    f = open(fn, "r")
    lines = readlines(f)
    close(f)
    n = parse(Int64, lines[1])
    X = Array{Int64}(undef, n, 9)
    for i = 1:n; X[i,:] = map(x -> parse(Int64, x), split(lines[i+1], " ")); end
    return X
end

function check(z::Array{Int64, 1})
    if (1 in z) && (2 in z) && (3 in z); return true; end
    if (1 in z) && (5 in z) && (9 in z); return true; end
    if (1 in z) && (4 in z) && (7 in z); return true; end
    if (2 in z) && (5 in z) && (8 in z); return true; end
    if (3 in z) && (6 in z) && (9 in z); return true; end
    if (4 in z) && (5 in z) && (6 in z); return true; end
    if (7 in z) && (8 in z) && (9 in z); return true; end
    if (7 in z) && (5 in z) && (3 in z); return true; end
    return false
end

function engine(m::Array{Int64, 1})
    x = Array{Int64}(undef, 5)
    o = Array{Int64}(undef, 4)
    c = 0

    for i = 1:9
        if isodd(i)
            c += 1
            x[c] = m[i]
        else
            o[c] = m[i]
        end

        if (i == 5) && check(x[1:3]); return i; end
        if (i == 9) && check(x[1:5]); return i; end

        if (i > 5) && (i < 9)
            if check(x[1:c]) || check(o[1:c]); return i; end
        end
    end

    return 0
end

function main(fn::AbstractString = "data.dat")
    data = ReadDataFile(fn)
    println(join([engine(data[i,:]) for i = 1:size(data,1)], " "))
end
