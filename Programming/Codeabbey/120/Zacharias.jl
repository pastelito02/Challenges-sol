#Author Zacharias
function ReadDataFile(fn::AbstractString)
    f = open(fn, "r")
    lines = readlines(f)
    close(f)
    n = parse(Int64, lines[1])
    return map(x -> parse(Int64, x), split(lines[2], " ")), n
end

function engine(x::Array{Int64, 1}, n::Int64)
    n1 = n - 1
    ind = Array{Int64}(undef, n1)

    for i = 1:n1
        ind[i] = argmax(x)
        x[ind[i]] = x[end]
        x = x[1:(end-1)]
    end

    return ind .- 1
end

function main(fn::AbstractString = "data.dat")
    data, n = ReadDataFile(fn)
    println(join(engine(data, n), " "))
end