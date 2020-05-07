#Author Zacharias
function LoadWords(fn::String = "dictionary.txt")
  f = open(fn, "r")
  words = readlines(f)
  close(f)
  return words
end

function ReadDataFile(fn::AbstractString)
  f = open(fn, "r")
  lines = readlines(f)
  close(f)
  return lines[2:end]
end

function engine(x::String, words::Array{String, 1})
  N = length(words)
  n = length(x)
  sx = sort(split(x, ""))
  c = 0

  for i = 1:N
      if length(words[i]) == n
          sw = sort(split(words[i], ""))
          if sw == sx; c += 1; end
      end
  end

  return c - 1
end

function main(fn::String = "data.dat", words::Array{String, 1} = [" "])
  if length(words) == 1; words = LoadWords(); end
  data = ReadDataFile(fn)
  n = length(data)
  z = [engine(data[i], words) for i = 1:n]
  println(join(z, " "))
end
