'Author Guy Gervais
Sub Main
    Dim grid = input.Split(chr(10)).ToArray.Select(Function(x) x.split(" "c)).ToArray
    Paths(grid, 0, 0).Dump
End Sub

Function Paths(grid As String()(), x As Integer, y As Integer) As Integer
    If x = grid.Length OrElse y = grid(0).Length OrElse grid(x)(y) = "X" Then Return 0
    If grid(x)(y) = "$" Then Return 1
    Return Paths(grid, x+1, y) + Paths(grid, x, y+1)
End Function

Function input() As String
    Return <![CDATA[
@ + + + + + + + + + + + + + + + +
+ + X + + + + X X + + + + + X + +
+ + X + + + + + + + + + + + + + +
+ + + + + + + + + + + + + + + + +
+ + + + + + + + + + X + X X + + X
+ + X + + + X + X + + X + + + + +
+ + + + + + + + X + + + + + + X X
+ + + + + + + + + X + + + X X + +
+ + + + + + + + + + + + + + + + X
+ X + + + + X + + + + + X + + + X
+ + + X + + + + + + + + + + + + +
+ + + + + X + + + + + + + + + + +
+ + X + X X + + + + + + + + + + +
+ + + + + + X + X + + + X + X + +
+ + + + + X X + + + + + X + + + X
+ + + + + + + + X + + + + + + + +
+ + + + + + X + + + + + + + + + $
        ]]>.Value.Trim
End Function