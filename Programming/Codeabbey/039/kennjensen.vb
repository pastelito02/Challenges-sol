'Author kennjensen
#lang "fblite"
defdbl m
common shared MYARRAY()
function stringtoarray(st$,delim$=" ")
  dim MYARRAY(len(st$))
  wd$="":count=1
  for i=1 to len(st$)
    if mid(st$,i,1)<>delim$ then:wd$+=mid$(st$,i,1):else:MYARRAY(count)=val(wd$):wd$="":count+=1:end if
  next
  MYARRAY(count)=val(wd$) 'Or last value will be missed
  stringtoarray=count
end function

input n
ans$=""
for s=1 to n
  input opg$
  stock$=left(opg$,4):opg$=right(opg$,len(opg$)-5)
  stringtoarray(opg$)
  m=0
  for v=1 to 14
    m+=MYARRAY(v)
  next
  mean=m/14
  m1=0
  for w=1 to 14
    m1+=(MYARRAY(w)-mean)^2
  next
  mdev=(m1/14)^0.5
  if mdev>=4*mean/100 then ans$+=stock$+" "
next
print ans$
