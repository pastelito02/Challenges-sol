#Author chenxiaowei
import math

def devi(x):
  s = 0
  for i in x:
    s += i
  mean = s/len(x)
  means = 0
  for i in x:
    means = means + (i-mean)**2
  means = means/len(x)
  devi = math.sqrt(means)
  return mean,devi

a = int(input())
results = []
for i in range(a):
  b = input().split()
  c = list(map(int, b[1:]))
  if devi(c)[1] >= devi(c)[0]*0.04:
    results.append(b[0])

for i in results:
  print(i, end=' ')
