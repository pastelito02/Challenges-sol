#Author Zacharias
global tol = 1e-7

function ReadDataFile(fn::AbstractString)
    f = open(fn, "r")
    lines = readlines(f)
    close(f)
    return map(x -> parse(Float64, x), split(lines[2], " "))
end

function engine(x::Array{Float64, 1})
    m = 1 / tol
    n = length(x)
    z = Array{Float64}(undef, n)
    z[1] = x[1]
    z[end] = x[end]
    for i = 2:(n-1); z[i] = round(m * (x[i-1] + x[i] + x[i+1]) / 3) / m; end
    return z
end

function main(fn::AbstractString = "data.dat")
    data = ReadDataFile(fn)
    println(join(engine(data), " "))
end
