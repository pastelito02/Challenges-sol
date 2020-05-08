#Author rkrch21
pos1= list(range(0,10))
pos2= list(range(0,10))
pos3= list(range(0,10))
pos4= list(range(0,10))
one=[]
two=[]
three=[]
four=[]
compare=[2,1,1,1,3]


l=[["8730",0],["7718",0],["1612",0],["9930",0],["9395",2],["9612",0],["2348",1],["6235",1],["9767",0],["5856",1],["5685",3]]

for i in l:
  a,b=i
  if(b==0):
    if(int(a[0]) in pos1):
      x=pos1.index(int(a[0]))
      pos1.pop(x)


    if(int(a[1]) in pos2):
      x=pos2.index(int(a[1]))
      pos2.pop(x)


    if(int(a[2]) in pos3):
      x=pos3.index(int (a[2]))
      pos3.pop(x)


    if(int(a[3]) in pos4):
      x=pos4.index(int (a[3]))
      pos4.pop(x)

for i in pos1:
  temp=''
  temp+=str(i)
  one.append(temp)

for j in one:

  for i in pos2:
    two.append(j+str(i))

for j in two:
  for i in pos3:
    three.append(j+str(i))

for j in three:
  for i in pos4:
    four.append(j+str(i))

for i in four:
  checker=[]

  for j in l:
    a,b=j

    if(b!=0):


      count=0
      if(a[0]==i[0]):
        count+=1
      if(a[1]==i[1]):
        count+=1
      if(a[2]==i[2]):
        count+=1
      if(a[3]==i[3]):
        count+=1
      checker.append(count)
  if(checker==compare):
    print(i)
    break
  else:
    continue
