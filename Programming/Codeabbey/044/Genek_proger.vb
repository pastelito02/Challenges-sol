'Author Genek_proger
Sub fourty_four()   'ñðåäíåå â òðîéêå ÷èñåë

Dim N As Byte

Sheets("44").Activate
With Sheets("44")

  N = Cells(1, 1).Value

  For i = 1 To N
    Cells(4 + N, i).Value = (Cells(1 + i, 1).Value Mod 6) + 1 + _
                  (Cells(1 + i, 2).Value Mod 6) + 1
  Next i

End With

End Sub
