#Author yamlrosbpi
d={' ':'11', 'e':'101', 't':'1001', 'o':'10001', 'n':'10000', 'a':'011', 's':'0101', 'i':'01001', 'r':'01000', \
    'h':'0011', 'd':'00101', 'l':'001001', '!':'001000', 'u':'00011', 'c':'000101', 'f':'000100', 'm':'000011', \
    'p':'0000101', 'g':'0000100', 'w':'0000011', 'b':'0000010', 'y':'0000001', 'v':'00000001', 'j':'000000001', \
      'k':'0000000001', 'x':'00000000001', 'q':'000000000001', 'z':'000000000000' }
S=""
inp=raw_input()
for i in inp:
    S=S+d.get(i)
if len(S)%8==0:
    N=len(S)/8
else:
    N=len(S)/8+1
S_Mas=[]
for i in range(N):
    S_Mas.append( S[8*i:8*(i+1)] )
BadZer=0
if len(S_Mas[N-1])<8:
    BadZer=8-len(S_Mas[N-1])
    S_Mas[N-1]=S_Mas[N-1]+'0'*( 8-len(S_Mas[N-1]) )
S=""
for i in S_Mas:
    H16=hex(int(i, 2))[2:]
    if len(H16)<2:
        S=S+"0"+H16.upper()+" "
    else:
        S=S+H16.upper()+" "
print S
