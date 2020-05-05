'Author champagnepapi
Module module24

  'bubble in array
  'http://www.codeabbey.com/index/task_view/bubble-in-array
  '20/02/17
  'OD

  Sub main()
    Dim data As String = Console.ReadLine()
    Dim dataAsString() As String = data.Split(" ")
    Dim arraySize As Integer = dataAsString.Length
    Dim dataAsInteger(arraySize - 1) As Integer
    Dim t, swaps As Integer
    Dim bubbledString As String

    For i As Integer = 0 To arraySize - 1
      dataAsInteger(i) = dataAsString(i)
    Next

    For i As Integer = 0 To arraySize - 2
      If dataAsInteger(i + 1) < dataAsInteger(i) And dataAsInteger(i + 1) <> -1 Then
        t = dataAsInteger(i + 1)
        dataAsInteger(i + 1) = dataAsInteger(i)
        dataAsInteger(i) = t
        swaps += 1
      End If
      bubbledString &= dataAsInteger(i) & " "
    Next

    Console.Write(swaps & " " & checkSum(bubbledString, arraySize - 1))
    Console.ReadLine()
  End Sub

  Function checkSum(ByVal BubbledString As String, arraySize As Integer)
    Dim result As Int64 = 0
    Dim seed As Integer = 113
    Dim limit As Integer = 10000007
    Dim dataStore(arraySize - 1) As Integer

    For i As Integer = 0 To arraySize - 1
      dataStore(i) = BubbledString.Split(" ")(i)
      result = (result + dataStore(i)) * seed
      result = result Mod limit
    Next
    Return result
  End Function
End Module
