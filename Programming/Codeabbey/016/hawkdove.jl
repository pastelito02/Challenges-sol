#Author hawkdove
function processarrays(infile)
  infile = open(infile)
  lines = readlines(infile)
  close(infile)
  storearrays = []
  for line in lines[2:end]
      push!(storearrays, [parse(Int64, x) for x in split(line, " ")][1:(end - 1)])
  end
  storearrays
end

function avgarray(v)
  sum(v)/length(v)
end

print.(convert.(Int64, round.(avgarray.(processarrays("input_data")))), " ")
