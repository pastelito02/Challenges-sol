'Author Genek_proger
Sub twenty_nine()   'сортировка пузырьком и нахождение начальных позиций

Dim m, a(), pos() As Long
Dim N, sh1, sh2 As Byte

Sheets("29").Activate
With Sheets("29")
    
    N = Cells(1, 1).Value
    ReDim Preserve a(N)
    ReDim Preserve pos(N)
    
    m = 0
    sh1 = 0
    sh2 = 0
    
    For i = 1 To N
        a(i) = Cells(2, i).Value
        pos(i) = Cells(2, i).Value
    Next i
           
    Do
        sh2 = sh1
        For i = 1 To N - 1
            If a(i) > a(i + 1) Then
                sh1 = sh1 + 1
                m = a(i)
                a(i) = a(i + 1)
                a(i + 1) = m
            End If
        Next i
    Loop Until sh1 = sh2
    
    For i = 1 To N
        For j = 1 To N
            If a(i) = pos(j) Then
                a(i) = j
                Exit For
            End If
        Next j
    Next i
    
    For i = 1 To N
        Cells(5, i).Value = a(i)
    Next i
       
End With

End Sub