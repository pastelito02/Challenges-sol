#Author tomw
for _ in range(int(input())):
  n = int(input())
  for a in range(1, n):
    b = n * (n - 2*a) / (n-a) / 2
    if b % 1 == 0: # this is faster than int(b) or n-a-b
      print(int(a*a + b*b), end=" ") # a*a is faster than a**2
      break
