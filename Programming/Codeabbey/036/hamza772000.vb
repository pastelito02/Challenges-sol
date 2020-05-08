'Author hamza772000
Module Module1

  Sub Main()
    Dim str As String = ""
    Dim x As New List(Of Integer)
    For i As Integer = 0 To 9999
      x.Add(i)
    Next
    Dim y As New Dictionary(Of String, Integer)
    For i As Integer = 0 To Console.ReadLine - 1
      Dim arr() As String = Console.ReadLine.Split(" ")
      y.Add(arr(0), CInt((arr(1))))
    Next


    Dim guess As String = ""
    For Each item As KeyValuePair(Of String, Integer) In y
      guess &= item.Key & " "
    Next
    guess = guess.Trim

    Dim guesses() As String = guess.Split(" ")
    For j As Integer = 0 To guesses.Length - 1
      For i As Integer = 0 To 9999
        If match((guesses(j)), i) <> y(guesses(j)) Then
          x.Remove(i)
        End If
      Next
    Next


    For i As Integer = 0 To x.Count - 1
      str &= x(i) & " "
    Next

    Console.Write(str)


    Console.ReadLine()
  End Sub
  Function match(ByVal x As Integer, y As Integer)
    Dim count = 0
    For i = 0 To 3
      If x Mod 10 = y Mod 10 Then
        count += 1
      End If
      x \= 10
      y \= 10
    Next
    Return count
  End Function
End Module
