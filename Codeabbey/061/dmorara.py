#Author dmorara
n=3000000
ans=[]
a=[]
prime = [True for i in range(n + 1)]
p = 2
while (p * p <= n):

    # If prime[p] is not changed, then it is a prime
  if (prime[p] == True):

    # Update all multiples of p
    for i in range(p * 2, n + 1, p):
      prime[i] = False
  p += 1
prime[0]= False
prime[1]= False
    # Print all prime numbers
for p in range(n + 1):
  if prime[p]:
    a.append(p)
inp="183738 115722 134232 173358 130874 192972 175639 150340 102865 145862 167495"
inp=inp.split(" ")
inp=list(map(int,inp))
print(inp)
def min(n):
  return n - 1
inp=list(map(min,inp))
for i in inp:
  ans.append(a[i])
ans=list(map(str,ans))
ans=(" ".join(ans))
print(ans)
