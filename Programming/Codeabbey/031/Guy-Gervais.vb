'Author Guy Gervais
Sub Main
    
    Dim input = <![CDATA[
-2 gemjamivolesceuoaoipx
4 qizymskswwurcegiqk
2 ncqjbyaiblzkerxwojnr
2 lfsopdoyqrpaspaarguol
-3 buptcohotakdezc
-3 jubdwsklovrbxtehgavoo
-2 ngsqvudiyfcpxmagcmhzyfa
-3 vuainnfyioobztgucijeel
-4 jrfpwueludykiyid
-1 hpzkncirnrisapxkgtorqrkaa
-3 wloeaviixqafcyxehphndwyti
6 mqaduobxqjyizao    
]]>.Value()

    dim ans =""
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        dim tokens = line.split(" "c)    
        dim rot = cint(tokens(0))
        dim word = tokens(1)
        dim rw = RotateWord(word, rot)
        ans &= rw & " "
    next
    ans.dump
    
End Sub

function RotateWord(word as string, rotation as integer) as string
    if rotation = 0 then return word
    dim arr = word.tochararray ' rotate "in place" using array
    if rotation > 0 then
        for i = 1 to rotation
            dim tmp = arr(0)
            for j = 0 to arr.length - 2
                arr(j) = arr(j+1)
            next
            arr(arr.length-1) = tmp
        next
    else
        for i = 1 to rotation * -1
            dim tmp = arr(arr.length-1)
            for j = arr.length-1 to 1 step - 1
                arr(j) = arr(j-1)
            next
            arr(0) = tmp
        next
    end if    
    dim s = cstr(arr)
    return s
end function
