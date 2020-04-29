# Author melisale
data = split("2
0 0 1 1
1 0 0 1", "\n")

iterator = int(data[1])+1

for i in 2:iterator
  x1, y1, x2, y2 = float(split(data[i]))

  m = (y2-y1)/(x2 - x1)

  q = int(y1 - m*x1)

  m = int(m)

  println("($m $q) ")
end
