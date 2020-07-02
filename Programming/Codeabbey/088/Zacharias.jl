#Author Zacharias
global A = 55 * [2^(i-1) for i = 1:6] # Frequency of A notes for various octaves

function ReadDataFile(fn::AbstractString)
    f = open(fn, "r")
    lines = readlines(f)
    close(f)
    n = parse(Int64, lines[1])
    X = Array{AbstractString}(undef, n)
    temp = split(lines[2], " ")
    for i = 1:n; X[i] = temp[i]; end
    return X
end

function DistFromClosestA(n::AbstractString, o::Int64)
    if n == "A"
        return 0, A[o], 0
    elseif n == "G#"
        return 1, A[o], 1
    elseif n == "A#"
        return 1, A[o], -1
    elseif n == "G"
        return 2, A[o], 1
    elseif n == "B"
        return 2, A[o], -1
    elseif n == "F#"
        return 3, A[o], 1
    elseif n == "C"
        if o > 1
            return 3, A[o-1], -1
        else
            return 9, A[o], 1
        end
    elseif n == "F"
        return 4, A[o], 1
    elseif n == "C#"
        if o > 1
            return 4, A[o-1], -1
        else
            return 8, A[o], 1
        end
    elseif n == "E"
        return 5, A[o], 1
    elseif n == "D"
        if o > 1
            return 5, A[o-1], -1
        else
            return 7, A[o], 1
        end
    elseif n == "D#"
        return 6, A[o], 1
    end
end

function engine(note::AbstractString)
    n = note[1:(end-1)]
    o = parse(Int64, note[end])
    s, f, d = DistFromClosestA(n, o)
    fs = 2^(s/12) # frequency shift

    if d > 0
        z = f / fs
    elseif d < 0
        z = f * fs
    else
        z = f
    end

    return round(Int64, z)
end

function main(fn::AbstractString = "data.dat")
    data = ReadDataFile(fn)
    println(join(map(engine, data), " "))
end