'Author kennjensen
#lang "fblite"
defdbl a
common shared MYARRAY()
function stringtoarray(st$,delim$=" ")
  dim MYARRAY(3)
  wd$="":count=1
  for i=1 to len(st$)
    if mid(st$,i,1)<>delim$ then:wd$+=mid$(st$,i,1):else:MYARRAY(count)=val(wd$):wd$="":count+=1:end if
  next
  MYARRAY(count)=val(wd$)
  stringtoarray=none
end function

input n
ans$=""
for i=1 to n
  input value$
  stringtoarray(value$)
  a=MYARRAY(1)*MYARRAY(2)/(MYARRAY(2)+MYARRAY(3))
  ans$+=str(a)+" "
next
print ans$
