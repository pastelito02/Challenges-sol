#Author Menshikov Ivan
a=[]
a=input().split(" ")

primes=[2]
number=3
p=True
print("Calculating... Please, wait...")
while len(primes)<=200000:
  for prime in primes:
    if number % prime == 0:
      p=False
      break
  if p:
    primes.append(number)
    l=len(primes)
    if l % 5000 == 0:
      print(l)
  number+=1
  p=True
for i in a:
  print(str(primes[int(i)-1]), end=" ")
