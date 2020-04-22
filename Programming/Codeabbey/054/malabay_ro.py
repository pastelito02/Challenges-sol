#Author malabay_ro
str_out = ""

for s in list :
  S = int(s)

  k1 = int(S*S/(2*S-1))
  k2 = S
  for K in range(k1,k2) :
    b = (2*K*S-S**2)/(2.0*K)
    if b == int(b)  and b > 0 and  b < S:
       a =  S*(S-2*b)/(2*S-2*b)
       if a == int(a) and a > 0 and a < S and a < b:
        str_out = str_out + str(int(a*a+b*b)) + " "
        break
print(str_out)
