;Author Daraysen
dice1 = []
dice2 = []

n = int(input("n: \n"))

for x in range(n):
  dice1.append(0)
  dice2.append(0)
  dice1[x], dice2[x] = [int(i) for i in input().split()]
  dice1[x] = dice1[x]%6
  dice2[x] = dice2[x]%6
  dice1[x] += 1
  dice2[x] += 1
  dice1[x] += dice2[x]
print(*dice1)
