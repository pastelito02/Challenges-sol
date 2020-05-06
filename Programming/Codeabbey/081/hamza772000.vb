'Author hamza772000
Imports System.IO
Module Module1

  Sub Main()
    Dim ans As String = ""
    Dim nums As Integer = Console.ReadLine()
    Dim count As Integer
    For i As Integer = 1 To nums
      Dim x As String

      Dim conversion As Double = Console.ReadLine()

      If conversion > 0 Then
        x = ConvertToBin(conversion)
      Else
        x = ConvertToBin(TwosComplement(-conversion))
      End If

      Dim arr() As String = x.Split(" ")
      For k As Integer = 0 To arr.Length - 1
        For Each element As Char In arr(k)
          If element = "1" Then
            count += 1
          End If
        Next


      Next
      ans &= count & " "
      count = 0
    Next
    'Console.WriteLine(Chr(97))
    Console.WriteLine(ans)

    Console.ReadLine()
  End Sub
  Function ConvertToBin(ByVal x As Double)
    Dim ans As String = ""
    Dim result As String = ""
    For i As Integer = 1 To 32
      result = x Mod 2
      x = x \ 2
      ans &= " " & result
    Next
    Return StrReverse(ans)
  End Function
  Function TwosComplement(b As Double) As Double

    TwosComplement = Math.Pow(2, 32) - b

    Return TwosComplement

  End Function
End Module
