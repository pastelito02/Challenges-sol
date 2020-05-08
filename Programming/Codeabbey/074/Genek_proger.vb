'Author Genek_proger
Public Sub seventy_four()

Dim N As Byte
Dim TimeStr As String
Dim hour As Byte
Dim minute As Byte
Dim coord As Double

Sheets("74").Activate
With Sheets("74")

  N = Cells(1, 1).Value

  For i = 1 To N

    TimeStr = Cells(2, i).Value
    If Mid(TimeStr, 2, 1) = ":" Then
      hour = Val(TimeStr)
      minute = Val(Mid(TimeStr, 3, 2))
    Else
      hour = Val(TimeStr)
      minute = Val(Mid(TimeStr, 4, 2))
    End If

    coord = 10 + 6 * Sin(8 * Atn(1) / 12 * (hour Mod 12) + 8 * Atn(1) / 12 / 60 * minute)
    Cells(3, 4 * i - 3).Value = cabb_f(coord)
    coord = 10 + 6 * Cos(8 * Atn(1) / 12 * (hour Mod 12) + 8 * Atn(1) / 12 / 60 * minute)
    Cells(3, 4 * i - 2).Value = cabb_f(coord)
    coord = 10 + 9 * Sin(8 * Atn(1) / 60 * minute)
    Cells(3, 4 * i - 1).Value = cabb_f(coord)
    coord = 10 + 9 * Cos(8 * Atn(1) / 60 * minute)
    Cells(3, 4 * i - 0).Value = cabb_f(coord)

  Next i

End With

End Sub
