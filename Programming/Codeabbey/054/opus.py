#Author opus
numOfNums = int(input())
for i in range(numOfNums):
  s = int(input())//2
  u, v = 1, 2
  while True:
    while v**2+v*u < s:
      v += 1
    if v**2 + v*u == s:
      break
    else:
      u += 1
      v = 1
  print((u**2+v**2)**2, end=' ')
