#Author Kenshin
from math import sqrt,ceil

def fermat_rsa(s):
    n,c=list(map(int,s.split('\n')))
    p,q=factorize(n)
    e=65537
    phi=n-p-q+1
    d=solve_bezout_eq([e,phi])[0]%phi
    a=fast_modular_exp(c,d,n)
    lst=[str(a)[2*i:2*i+2] for i in range(len(str(a))//2)]
    print(''.join(list(map(lambda s: chr(int(s)),lst[:lst.index('00')]))))

def solve_bezout_eq(lst):
    lst_b=lst[:]
    s_p=t_c=1
    s_c=t_p=0
    while True:
        min_c,max_c=min(lst),max(lst)
        q,r=max_c//min_c,max_c%min_c
        if r==0:
            break
        lst[lst.index(max_c)]=r
        backup=s_c,t_c
        s_c=s_p-q*s_c
        t_c=t_p-q*t_c
        s_p,t_p=backup
    new_lst=[s_c,t_c]
    if lst_b==sorted(lst_b):
        new_lst=new_lst[::-1]
    return new_lst

fast_modular_exp=lambda num,power,base: num%base if power==1 else fast_modular_exp((num**2)%base,power//2,base) if power%2==0 else (num*fast_modular_exp((num**2)%base,(power-1)//2,base))%base

def factorize(n):
    start=get_sqrt(n)
    i=0
    while True:
        crr=(start+i)**2-n
        c_sqrt=get_sqrt(crr)
        if c_sqrt**2-crr==0:
            break
        i+=1
    num_2=c_sqrt
    num_1=get_sqrt(n+num_2**2)
    return num_1-num_2,num_1+num_2

def get_sqrt(n):
    l,r=0,n
    while r-l-1:
        m=(l+r)//2
        vals=[i**2 for i in (l,m,r)]
        if n in vals:
            return (l,m,r)[vals.index(n)]
        elif vals[0]<n<vals[1]:
            r=m
        else:
            l=m
    return r

test_input_1="""2005386240811006492510206908835874977464399827995998174235015291258133373258958037573585627
258926557618335589879504876460462075566410747651590614428022205934562315249635550863811428"""

fermat_rsa(test_input_1)

test_input_2="""1504275169289991604206978016012592094440060513092419853646369675355799767817296328747621021
918418977660537932534922691074380356327782699241698403546970315944502618267693008487136796"""

fermat_rsa(test_input_2)
