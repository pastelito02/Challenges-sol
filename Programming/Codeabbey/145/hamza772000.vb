'Author hamza772000
Imports System.Numerics
Module Module1

    Sub Main()
        Dim ans As String = ""
        Dim nums As Integer = Console.ReadLine

 For i As Integer = 1 To nums
            Dim arr() As String = Console.ReadLine.Split(" ")
            Dim x = arr(0)
            Dim y = arr(1)
            Dim z = arr(2)

            ans &= expmod(x, y, z) & " "
        Next
        Console.WriteLine(ans)
        Console.ReadLine()

    End Sub
    Function expmod(ByVal a As Integer, ByVal b As Integer, ByVal c As Integer)
        If b = 0 Then
            Return 1
        ElseIf b Mod 2 = 0 Then
            Dim d = expmod(a, b / 2, c)
            Return (d * d) Mod c
        Else
            Return ((a Mod c) * expmod(a, b - 1, c)) Mod c
        End If
    End Function
End Module