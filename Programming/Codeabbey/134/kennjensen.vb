'Author kennjensen
#lang "fblite"
common shared MYARRAY()
function stringtoarray(st$,delim$=" ")
  dim MYARRAY(len(st$))
  wd$="":count=1
  for i=1 to len(st$)
    if mid(st$,i,1)<>delim$ then:wd$+=mid$(st$,i,1):else:MYARRAY(count)=valint(wd$):wd$="":count+=1:end if
  next
  MYARRAY(count)=valint(wd$) 'Or last value will be missed
  stringtoarray=count
end function

input opg$
stringtoarray(opg$)
W=MYARRAY(1):H=MYARRAY(2):L=MYARRAY(3):x=0:y=0:xdir=1:ydir=1:ans$=""
for stp=1 to 101
  ans$+=str(x)+" "+str(y)+" "
  x+=xdir
  y+=ydir
  if x=W-L then xdir=-1
  if x=0 then xdir=1
  if y=0 then ydir=1
  if y=H-1 then ydir=-1
next
print ans$
