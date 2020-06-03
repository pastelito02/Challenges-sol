#Author Zacharias
function ReadDataFile(fn::AbstractString)
    f = open(fn, "r")
    lines = readlines(f)
    close(f)
    n = parse(Int64, lines[1])
    X = Array{Int64}(undef, n, 3)
    for i = 1:n; X[i,:] = map(x -> parse(Int64, x), split(lines[i+1], " ")); end
    return X
end

function engine(x::Int64, y::Int64, n::Int64)
    r1 = 1 / x
    r2 = 1 / y

    for t = 1:typemax(Int64)
        p = floor(r1 * t) + floor(r2 * t)
        if p >= n; return t; end
    end
end

function main(fn::AbstractString = "data.dat")
    data = ReadDataFile(fn)
    println(join([engine(data[i,1], data[i,2], data[i,3]) for i = 1:size(data, 1)], " "))
end
