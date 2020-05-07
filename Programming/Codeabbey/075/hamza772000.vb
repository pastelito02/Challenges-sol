'Author hamza772000
Module Module1
  Dim loopindecies As String
  Sub Main()
    Dim ans As String = ""
    Dim ones, twos, threes, fours, fives As Integer
    For i As Integer = 0 To Console.ReadLine - 1
      Dim x As String = Console.ReadLine()


      Dim y As String = ""


      For Each item As String In x
        If y.Contains(item) = False Then
          y &= item & " "
        End If
      Next

      y = y.Trim
      Dim arr() As String = y.Split(" ")
      Dim dic As New Dictionary(Of String, Integer)
      For Each item As String In arr
        dic.Add(item, count(x, item))
      Next
      For Each item As KeyValuePair(Of String, Integer) In dic
        If dic(item.Key) = 1 Then
          ones += 1
        ElseIf dic(item.Key) = 2 Then
          twos += 1
        ElseIf dic(item.Key) = 3 Then
          threes += 1
        ElseIf dic(item.Key) = 4 Then
          fours += 1
        ElseIf dic(item.Key) = 5 Then
          fives += 1
        End If
      Next

      If twos = 1 And threes = 0 And fours = 0 And fives = 0 Then
        ans &= "pair" & " "
      ElseIf threes = 1 And twos = 0 And fours = 0 And fives = 0 Then
        ans &= "three" & " "
      ElseIf fours = 1 And twos = 0 And threes = 0 And fives = 0 Then
        ans &= "four" & " "
      ElseIf fives = 1 And twos = 0 And threes = 0 And fours = 0 Then
        ans &= "yacht" & " "
      ElseIf twos = 2 And threes = 0 Then
        ans &= "two-pairs" & " "
      ElseIf twos = 1 And threes = 1 Then
        ans &= "full-house" & " "
      ElseIf straights(x) = 1 Then
        ans &= "small-straight" & " "
      ElseIf straights(x) = 0 Then
        ans &= "big-straight" & " "
      End If
      '   x = ""
      ones = 0
      twos = 0
      threes = 0
      fours = 0
      fives = 0
    Next


    Console.WriteLine(ans)
    Console.ReadLine()
  End Sub
  Function count(ByVal x As String, y As String)
    Dim count1 As Integer = 0
    For Each item As String In x
      If item = (y) Then
        count1 += 1
      End If
    Next
    Return count1

  End Function
  Function straights(ByVal x As String)
    Dim tmp = x
    Dim sstraight = False
    Dim bstraight = False
    Dim small As String = "12345"
    Dim big As String = "23456"
    Dim big1 = big
    Dim small1 = small
    Dim countbig As Integer = 0
    Dim countsmall As Integer
    For Each item As String In small
      If x.Contains(item) Then
        x = Replace(x, item, "", 1, 1)
        countsmall += 1
      End If
    Next

    x = tmp
    For Each item As String In big
      If x.Contains(item) Then
        x = Replace(x, item, "", 1, 1)
        countbig += 1
      End If
    Next

    If countsmall = Len(small1) Then

      Return 1
    ElseIf countbig = Len(big1) Then

      Return 0
    Else
      Return Nothing
    End If


  End Function

  Function Storeloops(ByVal x As String)
    Dim str As String
    Dim count = 1
    Dim index
    '    Dim loopindecies As String = ""
    For i As Integer = 0 To x.Length - 1
      If x(i) = "[" Then
        index = i
        count = 0
      ElseIf x(i) <> "]" Then
        count += 1
      ElseIf x(i) = "]" Then
        '       Console.WriteLine(count)
        loopindecies &= i & " "
        str &= x.Substring(index + 1, count) & " "
        count = 0
      End If

    Next
    Return str
  End Function
  Function interpret(ByVal x As String, ByRef currentcell As Integer, ByRef arr() As Integer)
    For Each item As String In x


      If item = ";" Then
        arr(currentcell) = Console.ReadLine
      ElseIf item = ">" Then
        currentcell += 1
      ElseIf item = "<" Then
        currentcell -= 1
      ElseIf item = "+" Then
        arr(currentcell) += 1
      ElseIf item = "-" Then
        arr(currentcell) -= 1


      End If


    Next

  End Function
  Function substr(ByVal x As String)
    Dim count = 0
    For Each item As String In x
      If item <> "]" Then
        count += 1
      Else
        x = x.Substring(0, count)
        Exit For
      End If
    Next
    Return x
  End Function
  Function count(ByVal x As String)
    Return x.Length


  End Function

  Function remove(ByRef x As String) As String
    Dim tmp1, tmp2 As String
    For Each item As String In x
      If item = "[" Then
        tmp1 = x.Substring(0, x.IndexOf(item) + 1)
      ElseIf item = "]" Then
        tmp2 = x.Substring(x.IndexOf(item) - 1, (x.Length - 1) - x.IndexOf(item))
        Exit For
      End If
    Next
    x = tmp1 & tmp2
  End Function
  Function ADVANA(ByVal x() As String, ByVal y As String, ByVal len As Integer)
    Dim tmp = y
    Dim finalstr As String = ""
    Dim count = 0
    For i As Integer = 0 To x.Length - 1
      If x(i).Length = len Then
        '    Console.WriteLine(x(i))
        For Each item As String In x(i)

          If y.Contains(item) Then
            y = Replace(y, item, "", 1, 1)
            count += 1
          End If

        Next
      End If
      If count = len Then
        finalstr &= x(i) & " "


      End If



      y = tmp
      count = 0
    Next
    finalstr = finalstr.Trim
    Dim arr() As String = finalstr.Split(" ")
    Return arr.Length

  End Function
End Module
