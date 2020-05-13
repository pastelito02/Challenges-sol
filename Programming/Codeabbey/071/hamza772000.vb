'Author hamza772000
Imports System.Numerics
Module Module1
  Dim f(2000000) As BigInteger
  Dim numtomod As Integer

  Sub Main()
    Dim previ As Integer
    Dim output As String = ""
    Dim ans As String = ""
    Dim arr() As String = Console.ReadLine.Split(" ")
    For y As Integer = 0 To arr.Length - 1
      numtomod = arr(y)
      For i As Integer = 0 To f.Length - 1
        f(i) = -1
        ans = fib(i).ToString
        If ans = 0 Then
          If i <> 0 Then
            output &= i & " "
            GoTo next1
          End If
        End If
      Next

next1:
    Next
    Console.WriteLine(output)
    Console.ReadLine()
  End Sub
  Function fib(ByVal n As BigInteger) As BigInteger
    If n <= 1 Then
      Return n
    End If
    If f(n) <> -1 Then
      Return f(n)
    End If
    f(n) = (fib(n - 1) + fib(n - 2)) Mod numtomod
    Return f(n)
  End Function
End Module
