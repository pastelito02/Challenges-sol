def divide(a):
    sum=0
    k=0
    j=0
    for i in a:
        sum+=i[1]
    for i in a:
        k+=i[1]
        if k>sum/2 and j>0 and k-sum/2>=i[1]/2:
            for m in range(len(a)):
                if m<j:
                    a[m][2]+="O"
                elif m>=j:
                    a[m][2]+="I"
            return(a)
        elif k>sum/2 and j==0 or k>sum/2 and k-sum/2<i[1]/2:
            for m in range(len(a)):
                if m<j+1:
                    a[m][2]+="O"
                elif m>=j+1:
                    a[m][2]+="I"
            return(a)
        else:
            j+=1

def ext(sort_freq):
    temp=[]
    t=[]
    k=0
    for i in range(len(sort_freq)):
        if i<len(sort_freq)-1 and sort_freq[i][2]==sort_freq[i+1][2]:
            k=1
            t+=[i]
            temp+=[sort_freq[i]]
        elif k==1:
            t+=[i]
            temp+=[sort_freq[i]]
            k=2
        if k==2:
            temp=list(divide(temp))
            for j in zip(t,temp):
                sort_freq[j[0]]=j[1]
            t=[]
            temp=[]
            k=0
    return sort_freq

text=input()
text=[i for i in text]
freq={}
sort_freq=[]
result=[]
for i in text:
    if i in freq:
        freq[i]+=1
    else:
        freq[i]=1
for i in freq:
    sort_freq.append([i,freq[i],""])
sort_freq.sort(key=lambda x:(x[1], -ord(x[0])), reverse=True)
sort_freq=divide(sort_freq)
same=[i[2] for i in sort_freq]
sort_freq=ext(sort_freq)
while same!=[i[2] for i in sort_freq]:
    same=[i[2] for i in sort_freq]
    sort_freq=list(ext(sort_freq))
#print(sort_freq)
for i in sort_freq:
    print(str(ord(i[0]))+" "+i[2]+" ", end="")
