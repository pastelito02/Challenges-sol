#Author Kronoc
data = input("data:\n").split()
numbers = int(data.pop(0))
index = []
primes = [2]

def isPrime(num):
  flag = True
  for p in primes:
    if num % p == 0:
      flag = False
    if p ** 2 > num:
      break
  return flag

for k in data:
  index.append(int(k))

k = 3

while len(primes) < max(index):
  if isPrime(k):
    primes.append(k)
  k += 1

for k in index:
  print (primes[k-1]),
