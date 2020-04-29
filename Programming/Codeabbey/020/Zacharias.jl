#Author Zacharias
function ReadDataFile(fn::AbstractString)
  f = open(fn, "r")
  lines = readlines(f)
  close(f)
  return lines[2:end]
end

function engine(s::AbstractString)
  c = 0

  for character in s
    if character in "aouiey"; c += 1; end
  end

  return c
end

function main(fn::AbstractString = "data.dat")
  data = ReadDataFile(fn)
  println(join(map(engine, data), " "))
end
