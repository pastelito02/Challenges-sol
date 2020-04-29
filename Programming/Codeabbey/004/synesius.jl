#Author synesius
function parse_nums_in_string(S::String)
  a = split(S, " ")
  b = int(a)

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

function parse_file(fn::String)
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

  return data
end

function minA(x::Array)
  m = typemax(Int128)

  for i = 1:length(x)
    if x[i] < m
      m = x[i]
    end
  end

  return m
end

function min2(N::Int64, numbers::Array)
  m = zeros(Int, N)

  for i = 1:N
    num = parse_nums_in_string(numbers[i])
    m[i] = minA(num)
  end

  return m
end

function main(fn = "data.txt")
  data = parse_file(fn)
  N = int(splice!(data,1))
  s = min2(N, data)
  print(array_to_string(s))
end

main()
