#Author alemelis
data = split("2
2 3
4 10", "\n")

iterator = int(data[1])+1

for i in 2:iterator
  a, b = int(split(data[i]))

  A, B = a, b

  while A != 0 && B != 0
    maxAB = max(A,B)
    minAB = min(A,B)

    maxAB = mod(maxAB,minAB)

    A = maxAB
    B = minAB
  end

  GCD = max(A,B)
  LCM = int(a*b/GCD)

  println("($GCD $LCM) ")
end