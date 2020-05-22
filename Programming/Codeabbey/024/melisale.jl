#Author melisale
data = split("3
0001 4100 5761", "\n")

iterator = int(data[1])

seeds = int(split(data[2]))

for i in 1:iterator
  d = seeds[i]
  
  prev = Set(d)

  iters = 1
  while true
    d *= d
    d = int(div(d,100))
    d = int(mod(d, 10000))
    a = Set(d)
    
    if issubset(a, prev)
      println(iters)
      break
    else
      iters += 1
      prev = union(d, prev)
    end
  end
end
  