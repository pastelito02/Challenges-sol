#Author Arvydas Ruibys
import math
def primeList(listLength):
  plist = [2, 3]
  j = 3
  while listLength > len(plist):
    prime = 'true'
    i = 0
    j +=2
    plist.append(j)
    while plist[i] <= math.sqrt(j) and prime == 'true':
      if j%plist[i] == 0:
        prime = 'false'
      i +=1
    if prime == 'false':
      plist.pop(-1)
  return plist

primes = primeList(200000)
rezultatas = ''
duomenys = input('ivesti duomenis ')
duomenys = duomenys.split(' ')
for x in duomenys:
  rezultatas += str(primes[int(x)-1]) + ' '

print (rezultatas)
