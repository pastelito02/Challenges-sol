#Author KetchupFaith
def prime(file):

  f = open(file,'r')
  n = int(f.readline())

  line = f.readline()
  S = line.split(' ')

  I = [i for i in range(0,2750132)]
  R = []

  for x in I:

    if x<2:

      continue

    elif x>2750132**0.5:

      break

    else:

      for i in range(x**2,2750132,x):

                I[i] = 0

  L = []

  for i in range(0,2750132):

    if I[i] > 1:

      L.append(i)

  for s in S:

    R.append(L[int(s)-1])

  S=''

  for r in R:

    S = S + str(r) + ' '

  return S[:-1]
