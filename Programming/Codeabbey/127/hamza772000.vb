'Author hamza772000
Module Module1

  Sub Main()
    Dim str As String = ""
    For i As Integer = 0 To Console.ReadLine() - 1
      str &= (Anagram(Console.ReadLine())) & " "
    Next
    Console.WriteLine(str)
    Console.ReadLine()
  End Sub
  Function Anagram(ByVal x As String)

    Dim tmp As String = x
    Dim str As String = ""
    Dim count = 0
    Dim anscount As Integer
    Dim lines() As String = System.IO.File.ReadAllLines("C:\Users\hamza.DESKTOP-8DJLPME\Desktop\Textfiles for programs\words.txt")

    For i As Integer = 0 To lines.Length - 1
      For Each item As String In lines(i).Trim
        If x.Contains(item) Then
          count += 1
          x = Replace(x, item, "", 1, 1)
        End If
      Next
      x = tmp

      If count = x.Length And lines(i).Length = x.Length Then
        anscount += 1
      End If

      count = 0
    Next
    anscount -= 1
    Return (anscount)

  End Function
End Module
