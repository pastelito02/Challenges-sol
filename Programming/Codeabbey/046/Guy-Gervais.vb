'Author Guy Gervais
Sub Main
    Dim answer As New List(Of String)
    For Each line In Split(input, vbLf)
        Dim game = Split(line, " ").Select(Function(n) CInt(n))
        Dim move(1) As Integer, win = False, count = 0
        For Each pos In game
            count += 1
            Dim player = count Mod 2
            move(player) = move(player) Or CInt(2 ^ (pos - 1)) ' board is nine bits.
            If CheckWin(move(player)) Then win = True : Exit For
        Next
        answer.Add(CStr(If(win, count, 0)))
    Next
    Join(answer.ToArray, " ").Dump
End Sub

Function CheckWin(Pos As Integer) As Boolean
    For Each win In {7, 56, 448, 73, 146, 292, 273, 84} ' Horiz * 3, Vert * 3, Diag * 2
        If (pos And win) = win Then Return True
    Next
    Return False
End Function