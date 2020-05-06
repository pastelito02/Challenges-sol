'Author hamza772000
Module Module1

  Sub Main()
    Dim str As String = ""
    For i As Integer = 1 To Console.ReadLine
      If bracs(Console.ReadLine()) Then
        str &= "1" & " "
      Else
        str &= "0" & " "
      End If
    Next

    Console.WriteLine(str)
    Console.ReadLine()
  End Sub
  Function bracs(ByVal x As String)
    Dim bool As Boolean = True
    Dim openings As String = "([{<"
    Dim closings As String = ")]}>"

    Dim match As String = "() {} [] <>"
    Dim matches() As String = match.Split(" ")

    x = remove(x)
    If x.Length Mod 2 <> 0 Then
      bool = False
      Return bool
    End If

    Dim y As New Stack

    For Each item As String In x
      If openings.Contains(item) Then
        y.Push(item)
      End If
      If closings.Contains(item) Then
        If y.Count = 0 Then
          bool = False
          Return bool
        Else
          Dim str = y.Pop & item

          If matches.Contains(str) = False Then
            bool = False
            Return bool
            Exit For


          End If
        End If
      End If

    Next
    Return bool
  End Function
  Function remove(ByVal x As String)
    Dim bracs As String = "()[]<>{}"
    For Each item As String In x
      If bracs.Contains(item) = False Then
        x = Replace(x, item, "", 1, 1)
      End If
    Next
    Return x
  End Function
