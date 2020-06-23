#Author K_Jarema
def seek(arr,yi,xj,mode=True):
    for i in range(-1,2,1):
        for j in range(-1,2,1):
            if yi+i>=0 and yi+i<len(arr) and xj+j>=0 and xj+j<len(arr[0]) and not (abs(i)==abs(j)):
                if mode:
                    if arr[yi+i][xj+j]=='1':
                        arr[yi + i][xj + j]=int(arr[yi][xj])+1
                else:
                    if arr[yi+i][xj+j]==arr[yi][xj]-1:
                        coord=[yi+i,xj+j]
                        return(coord)

arr=[]
with open('1.txt') as file:
    for line in file:
        d=list(line.rstrip())
        arr.append(d)
    starts = [[0, len(arr[0]) - 1],[len(arr)-1,0],[len(arr)-1,len(arr[0])-1]]
    #calculates all possible pathes
    for start in starts:
        arr[start[0]][start[1]]=0
        marking=True
        while marking:
            marking=False
            for i in range(len(arr)):
                for j in range(len(arr[0])):
                    if arr[i][j]=='1':marking=True
                    if not(arr[i][j]=='0' or arr[i][j]=='1'):
                        seek(arr, i,j)
        #finds route rom finish to start
        ni,nj=0,0
        text=''
        while not (ni==start[0] and nj==start[1]):
            coord=seek(arr,ni,nj,False)
            if coord[0] - ni > 0:text += 'U'
            elif coord[0] - ni < 0:text += 'D'
            elif coord[1] - nj > 0:text += 'L'
            else:text += 'R'
            ni,nj=coord[0],coord[1]
        #reverces text so now it is from start to finish
        text=list(text)
        text.reverse()
        i=0
        #changes textline
        while i<len(text)-1:
            if text[i]==text[i+1]:
                if i==0:
                    text[i]='2'
                    i+=1
                    continue
                num='LURD'.count(str(text[i-1]))
                if num>0:
                    text[i] = '2'
                    i += 1
                    continue
                else:
                    text[i-1]=str(int(text[i-1])+1)
                    text.pop(i)
                    continue
            i+=1
        text=''.join(text)
        print(text,end=' ')
        #returns array to initial position so we can start from another starting point
        for i in range(len(arr)):
            for j in range(len(arr[0])):
                if not arr[i][j]=='0':
                    arr[i][j]='1'

