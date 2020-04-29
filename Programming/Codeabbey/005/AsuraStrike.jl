#Author AsuraStrike
n = parse(Int, readline())
lst = Array{Int64}(zeros(n))
for i in 1:n
  str = split(readline())
  three_numbers = [parse(Int, str[1]), parse(Int, str[2]), parse(Int,str[3])]
  lst[i] = minimum(three_numbers)
end
for elem in lst
  print(elem, " ")
end
