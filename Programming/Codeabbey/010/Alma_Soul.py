#Author Alma_Soul
answer =""

data = """-338 7307 -58 867
-678 -48228 705 49965
-405 -33212 723 60412
960 -19874 621 -12755
397 -11450 -717 23084
-661 -33305 -283 -14405
953 -58073 -352 20227
-19 1777 -164 15262
778 42654 254 14358
-40 900 -608 26460
"""
data = data.splitlines()

for line in data:
  line = line.split(' ')

  line = [int(value) for value in line]


  a = (line[3] - line[1])/(line[2] - line[0])
  b = line[1] - a*line[0]

  answer += ('('+str(a)+' '+str(b)+')')+' '

print (answer)
