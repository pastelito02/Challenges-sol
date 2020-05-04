#Author synesius
function parse_nums_in_string(S::String)
  a = split(S, " ")
  b = float(a)

  return b
end

function array_to_string(A::Array)
  S = ""
  N = length(A)

  for i = 1:N
    S = string(S, A[i], " ")
  end

  return S[1:(length(S)-1)]
end

function parse_file(fn::String, header = true)
  if !(contains(fn,":"))
    fn = string("F:\\Julia\\data\\", fn)
  end

  f = open(fn, "r")
  data = readlines(f)
  close(f)

  for i = 1:length(data)
    if contains(data[i],"\r\n")
      n = length(data[i])
      data[i] = data[i][1:(n-2)]
    end
  end

  if header
    N = int(splice!(data,1))
    return N, data
  else
    return data
  end
end

function float_to_die_roll(x::Float64)
  z = ceil(x*6)
  return int(z)
end

function main(fn = "F:\\Julia\\data\\data.txt")
  N, data = parse_file(fn, true)
  s = Array(Int64, N)

  for i = 1:N
    x = float64(data[i])
    s[i] = float_to_die_roll(x)
  end

  print(array_to_string(s))
end

main()
