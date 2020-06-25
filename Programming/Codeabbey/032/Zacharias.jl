#Author Zacharias
function ReadDataFile(fn::AbstractString)
    f = open(fn, "r")
    lines = readlines(f)
    close(f)
    return map(x -> parse(Int64, x), split(lines[1], " "))
end

function main(fn::AbstractString = "data.dat")
    z = ReadDataFile(fn)
    n, k = z
    x = collect(1:n)
    p = 0

    while n > 1
        keep = trues(n)

        while true
            p += k
            if p > n; break; end
            keep[p] = false
        end

        p -= n
        if p > 0; p -= k; end
        x = x[keep]
        n = length(x)
    end

    println(x[1])
end