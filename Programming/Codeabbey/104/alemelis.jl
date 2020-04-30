#Author alemelis
data = split("3
1 3 9 5 6 0
1 0 0 1 10000 10000
7886 5954 9953 2425 6250 2108", "\n")

iterator = int(data[1])

for i in 2:iterator+1

  X1, Y1, X2, Y2, X3, Y3 = float(split(data[i], " "))

  A = sqrt((X1-X2)^2 + (Y1-Y2)^2)
  B = sqrt((X1-X3)^2 + (Y1-Y3)^2)
  C = sqrt((X2-X3)^2 + (Y2-Y3)^2)

  S = (A+B+C)*0.5

  @printf "%.1f " sqrt(S*(S-A)*(S-B)*(S-C))
end
