#Author Zacharias
function ReadDataFile(fn::AbstractString)
  f = open(fn, "r")
  lines = readlines(f)
  close(f)
  n = parse(Int64, lines[1])
  X = Array{Int64}(undef, n, 4)
  for i = 1:n; X[i,:] = map(x -> parse(Int64, x), split(lines[i+1], " ")); end
  return X, n
end

function engine(z::Array{Int64, 1})
  a = (z[4] - z[2]) / (z[3] - z[1])
  alpha = round(Int64, a)
  b = z[2] - a*z[1]
  beta = round(Int64, b)
  o1 = o2 = 0
  if a == alpha; o1 = alpha; else; o1 = a; end
  if b == beta; o2 = beta; else; o2 = b; end
  return o1, o2
end

function main(fn::AbstractString = "data.dat")
  data, n = ReadDataFile(fn)
  println(join([engine(data[i,:]) for i = 1:n], " "))
end
