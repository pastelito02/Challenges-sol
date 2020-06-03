'Author Genek_proger
Sub twenty_eight()   'ñîðòèðîâêà ïóçûðüêîì è íàõîæäåíèå êîíòðîëüíîé ñóììû(17)

Dim BMI As Double
Dim N As Byte

Sheets("28").Activate
With Sheets("28")
    
    N = Cells(1, 1).Value
    
    
    For i = 1 To N
        BMI = Cells(i + 1, 1).Value / Cells(i + 1, 2).Value ^ 2
        
        If BMI < 18.5 Then
            Cells(4 + N, i).Value = "under"
        ElseIf BMI >= 18.5 And BMI < 25 Then
            Cells(4 + N, i).Value = "normal"
        ElseIf BMI >= 25 And BMI < 30 Then
            Cells(4 + N, i).Value = "over"
        ElseIf BMI >= 30 Then
            Cells(4 + N, i).Value = "obese"
        End If
        
        Cells(3 + N, i).Value = BMI
    Next i
    
End With

End Sub