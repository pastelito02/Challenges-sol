#Author twelvedavinci21
n=int(input())
for i in range(n):
  s=input()
  s1=''
  for j in range(len(s)):
    if s[j] == ' ' or s[j]==',' or s[j]=="'" or s[j] =='.' or s[j]=='?' or s[j]=='!' or s[j]=='-':
      pass
    else:
      s1+=s[j]

  s1 = s1.lower()
  boolp=True;
  for j in range(int(len(s1)/2)):
    if s1[j]==s1[len(s1)-j-1]:
      pass
    else:
      boolp=False

  if boolp==True:
    print('Y', end=' ')
  else:
    print('N', end=' ')
