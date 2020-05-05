#Author Zacharias
global tol = 1e-7

function ReadDataFile(fn::AbstractString)
  f = open(fn, "r")
  lines = readlines(f)
  close(f)
  n = parse(Int64, lines[1])
  X = Array{Int64}(undef, n, 3)
  for i = 1:n; X[i,:] = map(x -> parse(Int64, x), split(lines[i+1], " ")); end
  return X, n
end

function engine(x::Array{Int64, 1})
  v_total = x[2] + x[3]
  t = x[1] / v_total
  s = x[2] * t

  if s == round(s)
    return Int64(s)
  else
    return s
  end
end

function main(fn::AbstractString = "data.dat")
  data, n = ReadDataFile(fn)
  println(join([engine(data[i,:]) for i = 1:n], " "))
end
