'Author kennjensen
#lang "fblite"
const PI as double = 3.1415926535897932
defdbl x,y,d
input n
sol$=""
for in=1 to n
  input opg$
  x=0:y=0
  for j=1 to len(opg$)
    t$=mid(opg$,j,1)
    select case t$
    case "A"
      x+=1
    case "B"
      x+=cos(60*PI/180)
      y+=sin(60*PI/180)
    case "C"
      x+=cos(120*PI/180)
      y+=sin(120*PI/180)
    case "D"
      x-=1
    case "E"
      x+=cos(-120*PI/180)
      y+=sin(-120*PI/180)
    case "F"
      x+=cos(-60*PI/180)
      y+=sin(-60*PI/180)
    end select
    'if x<0.00000001 then x=0
    'if y<0.00000001 then y=0
  next
  dist=sqr(x^2+y^2)
  sol$+=str(dist)+" "
next
print sol$
