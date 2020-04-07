#Author Art Savin
n = int(input())
index = [int(x) for x in input().split(' ')]

limit = 2800000
nums = [True]*limit
nums[0] = False
nums[1] = False
i = 2
while i*i < limit:
  m = 2
  while i*m  < limit:
    nums[i*m] = False
    m += 1
  i = nums.index(True, i+1)

primes = []
for j in range(limit):
  if nums[j] == True:
    primes.append(j)
for ind in index:
  print(primes[ind-1], end = ' ')
