'Author hamza772000
Imports System.Numerics
Imports System.Globalization
Imports System.IO
Module Module1


  Sub Main()
    Dim nums As Double
    Dim p As String = ""
    Dim str As String
    Dim bigint As Double
    Dim number As Double = 0
    Dim output As String = ""
    Console.WriteLine("Please enter the number of values you want this sequence to show: ")
    Dim numbers As Double = Console.ReadLine
    Dim myarray(numbers) As BigInteger
    Dim fibonacci As String = ""

    myarray(0) = 0
    myarray(1) = 1

    For i As Double = 2 To numbers
      myarray(i) = myarray(i - 2) + myarray(i - 1)
    Next
    For i As Double = 0 To numbers - 1
      fibonacci &= myarray(i).ToString & ","

    Next
    For j As Double = numbers To numbers
      fibonacci = fibonacci & myarray(j).ToString
    Next

    'Console.WriteLine("Your sequence is: " & fibonacci)
    Console.WriteLine("Please Enter string: ")
    Dim arr() As String = Console.ReadLine.Split(" ")
    For f As Integer = 0 To arr.Length - 1
      For i As Integer = 2 To myarray.Length - 1
        If myarray(i) Mod arr(f) = 0 Then
          Console.Write(i & " ")
          GoTo again
        End If
      Next
again:
    Next
    Console.ReadLine()
  End Sub
  Public Function Parse(
    value As String,
    style As NumberStyles
  ) As BigInteger

  End Function
End Module
