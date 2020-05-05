'Author alukicHGS
Imports System.IO

Module Module1

  Sub Main()
    Console.SetIn(New StreamReader(Console.OpenStandardInput(8192)))
    Dim input As String = Console.ReadLine
    Dim maxValue As Integer = input.Split(" ")(1)
    Dim counts(maxValue) As Integer

    Dim values() As String = Console.ReadLine.Split(" ")

    For i = 0 To values.Length - 1
      counts(values(i)) += 1
    Next

    For i = 1 To counts.Length - 1
      Console.Write(counts(i) & " ")
    Next

    Console.ReadLine()
  End Sub

End Module
