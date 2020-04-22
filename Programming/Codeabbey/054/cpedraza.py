#Author cpedraza
for s in [int(input()) for i in range(int(input()))]:
  n, m = 1.5, 1
  while n % 1 != 0 or m < n:
    m += 1
    n = ((s / 2) - (m ** 2)) / m
  print(int((m ** 2 + n ** 2) ** 2), end = ' ')
