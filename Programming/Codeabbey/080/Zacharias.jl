#Author Zacharias
function ReadDataFile(fn::AbstractString)
  f = open(fn, "r")
  lines = readlines(f)
  close(f)
  n = parse(Int64, lines[1])
  X = Array{Int64}(undef, n, 2)
  for i = 1:n; X[i,:] = map(x -> parse(Int64, x), split(lines[i+1], " ")); end
  return X
end

function engine(p::Array{Int64, 1})
  n = 5000000
  p /= 100
  wins = zeros(2)

  for i = 1:n
    OK = trues(2)
    turn = 1

    while all(OK)
      other = 3 - turn
      r = rand()

      if r < p[turn]
        OK[other] = false
        wins[turn] += 1
      end

      turn = other
    end
  end

  return round(Int64, 100 * wins[1] / n)
end

function main(fn::AbstractString = "data.dat")
  data = ReadDataFile(fn)
  println(join([engine(data[i,:]) for i = 1:size(data,1)], " "))
end
