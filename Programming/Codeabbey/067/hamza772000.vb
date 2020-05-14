'Author hamza772000
Imports System.Numerics
Imports System.Globalization
Module Module1
  Dim f(1000) As BigInteger
  Dim x As New Dictionary(Of String, String)
  Sub Main()
    fib(1000)
    Dim out = ""
    For i As Integer = 0 To Console.ReadLine - 1
      Dim p As String = Console.ReadLine()
      out &= x(p) & " "
    Next
    My.Computer.Clipboard.SetText(out.Trim)
    Console.ReadLine()

  End Sub
  Function fib(ByVal n As BigInteger) As BigInteger
    If n <= 1 Then
      Return n
    End If
    If f(n) <> 0 Then
      Return f(n)
    End If
    f(n) = (fib(n - 1) + fib(n - 2))
    x.Add(f(n).ToString, (n).ToString)
    Return f(n)
  End Function
End Module
