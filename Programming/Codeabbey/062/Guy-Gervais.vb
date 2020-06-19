'Author Guy Gervais
Sub Main

    Dim input = <![CDATA[
2132281 2654593
2629223 2723363
1545917 2311549
1444111 2419187
2339933 2528893
1570859 2132281
2237051 2339933
1854623 2016361
2117723 2382649
1620121 2654593
2397631 2454719
1951867 2421593
1854623 2378797
1392733 1794677
1684427 2071073
1748237 2506541
1748237 2020663
2070317 2378797
2563007 2654593
1620121 2335009
1446041 1951867
1464733 2352787
2188861 2447009
2489423 2528893
2562613 2563007
1464733 2309471
1642943 2237051
1722013 2309471
1464733 1854623
2535233 2578993
]]>.Value()
    
    dim ans = ""
    
    dim limit = 3000000
    dim primes = GetPrimes(limit)
    
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        dim nums = line.split(" "c).tolist.select(function(x) cint(x)).tolist
        
        dim sum = 0
        for i = nums(0) to nums(1)
            if primes(i) then sum +=1
        next
        ans += sum & " "
        
    next
    ans.dump
    
End Sub

Function GetPrimes(Limit as integer) as BitArray

    dim primes = new BitArray(limit, true)
    primes.set(0,false)
    primes.set(1,false)

    dim i = 0
    do while i * i < limit
        if primes.get(i) then
            dim j = i * i
            do while j < limit
                primes.set(j, false)
                j += i
            loop
        end if
        i += 1
    loop
    
    return primes

End Function