;Author Daraysen
erg = []
S = 0
P = 0
R = 0
n = 0
n = int(input("n: \n"))
for x in range(n):
  erg.append(0)
  S, R, P = [float(i) for i in input().split()]
  while S <= R:
    erg[x] += 1
    S += S * (P/100)
print(*erg)
