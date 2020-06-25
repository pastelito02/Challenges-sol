'Author Guy Gervais
' using LINQPad - VB Program
Sub Main    
    Josephus(80, 10).Dump    
End Sub

Function Josephus(n As Integer, k As Integer) As Integer
    Dim r = 0
    Dim i = 1
    Do While i <= n
        r = (r + k) Mod i
        i += 1
    Loop
    Return r + 1
End Function
