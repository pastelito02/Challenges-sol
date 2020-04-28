#Author Aghiad
def pos_leg(legs):
  solutions=[]
  maximum=legs/4
  for i in range(maximum,0,-1):
    if (legs-(i*4))/2==0:
      continue
    solutions.append([(legs-(i*4))/2,i])
  return solutions
def count(solutions,breasts):
  counter=0
  for pos in solutions:
    girls,pigs=pos
    bre_tot_pigs=breasts-(2*girls)
    if bre_tot_pigs%pigs==0 :
      if (bre_tot_pigs/pigs)%2==0:
        counter+=1
  return counter
f=open("e:\\1.txt","r")
vol=int(f.readline())
for z in range(vol):
  legs,breasts=map(int,f.readline().split())
  solutions=pos_leg(legs)
  print (count(solutions,breasts)),
