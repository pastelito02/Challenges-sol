#Author Zacharias
function ReadDataFile(fn::AbstractString)
    f = open(fn, "r")
    lines = readlines(f)
    close(f)
    return map(x -> parse(Int64, x), split(lines[2], " "))
end

function main(fn::AbstractString = "data.dat")
    x = ReadDataFile(fn)
    n = length(x)
    ind = Array{Int64}(undef, n)

    for i = 1:n
        ind[i] = argmin(x)
        x[ind[i]] = typemax(Int64)
    end

    println(join(ind, " "))
end