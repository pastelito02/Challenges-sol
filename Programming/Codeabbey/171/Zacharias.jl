#Author Zacharias
function ReadDataFile(fn::AbstractString)
  f = open(fn, "r")
  lines = readlines(f)
  close(f)
  n = parse(Int64, lines[1])
  X = Array{Float64}(undef, n, 2)
  for i = 1:n; X[i,:] = map(x -> parse(Float64, x), split(lines[i+1], " ")); end
  return X, n
end

function engine(x::Array{Float64, 1})
  a = deg2rad(x[2] - 90)
  return round(Int64, x[1] * tan(a))
end

function main(fn::AbstractString = "data.dat")
  data, n = ReadDataFile(fn)
  println(join([engine(data[i,:]) for i = 1:n], " "))
end
