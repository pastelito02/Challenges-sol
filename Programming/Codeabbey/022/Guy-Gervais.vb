'Author Guy Gervais
Sub Main

    Dim input = <![CDATA[
1287966 1258105 346
6079 21791 23754
334 109 866831
792943 2703988 50
308035 903284 561
1241430 886798 728
2 2 403526053
2 1 340149571
76 23 9458451
8411776 8716707 87
4027 4042 211760
11106 8884 89234
18279 47782 16386
2 4 203277860
3111 3114 182964
123162 29962 6933
60278236 28359829 7
621346 108893 1540
286948 8330349 82
]]>.Value()

    dim ans = ""
    
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        dim nums = line.split(" "c).tolist.select(function(x) cint(x)).tolist        
        dim spp1 = nums(0)
        dim spp2 = nums(1)
        dim pages = nums(2)

        dim np1 = spp1
        dim np2 = spp2

        dim min = GCD(spp1, spp2)

        dim s = 0
        do
            s = s + min
            if s >= np1 then
                pages -= 1
                np1 += spp1
            end if
            if s >= np2 then
                pages -= 1
                np2 += spp2
            end if
        loop until pages <= 0        
        ans &= s & " "
    next
    ans.dump

End Sub

function GCD(a as integer, b as integer) as integer ' Euclid's Algorithm
    dim temp = 0
    do while b <> 0
        temp = a mod b
        a = b
        b = temp
    loop
    return a
end function
