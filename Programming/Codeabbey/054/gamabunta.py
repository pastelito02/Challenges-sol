#Author gamabunta
data = [int(e) for e in '''
22873604
22221554
23382766
14996698
18296690
23969908
17026482
19672850
20247174
'''.strip().split('\n')]

def findTriplet(s):

  #print s
  for b in range(s/4, s/2+1):

    #print b
    aLo = 1
    aHi = b
    fLo = aLo**2 + b**2 - (s - aLo - b)**2
    fHi = aHi**2 + b**2 - (s - aHi - b)**2
    if fLo == 0: return (aLo, b, (s - aLo - b))
    if fHi == 0: return (aHi, b, (s - aHi - b))
    if fLo > 0: continue
    if fHi < 0: continue

    while aHi > aLo:

      #print aHi, aLo
      aMi = (aLo + aHi) / 2
      if aMi == aLo or aMi == aHi: break
      fMi = aMi**2 + b**2 - (s - aMi - b)**2
      if fMi == 0: return (aMi, b, (s - aMi - b))
      if fMi > 0: aHi = aMi; fHi = fMi
      if fMi < 0: aLo = aMi; fLo = fMi


for s in data:
  a, b, c = findTriplet(s)
  print (c**2),
