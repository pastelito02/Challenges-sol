#Author Valerii_Iliush
cd = '''142 8055 825 44254
-451 37801 -548 46143
850 57727 207 14646
231 5905 -173 -4195
360 31700 34 3338
704 27487 -813 -30159
128 7900 357 23472
35 1790 215 14030
40 2898 -927 -87033
-475 38589 869 -68931
77 2147 -382 -14377
444 21508 381 18358
-585 -39975 66 4293
252 -12472 -776 34816
581 -40127 -999 67313'''.splitlines()
def linter_func(data):
  output = []
  for el in data:
    temp = list(map(int,el.split()))
    a = int((temp[3]-temp[1])/(temp[2]-temp[0]))
    b = int(temp[1] - a * temp[0])

    output.append((a,b))
  return (' '.join(str(x) for x in output)).replace(',','')
l = linter_func(cd)
print(l)
