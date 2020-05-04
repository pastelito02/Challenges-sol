'Author felds858
Sub Main()
  Dim n As Integer = Console.ReadLine()
  Dim inputDec(n - 1) As Double
  Dim answer(n - 1) As Integer
  For i = 0 To n - 1
    inputDec(i) = Console.ReadLine()
    answer(i) = Fix(((inputDec(i) * 6) + 1))
  Next
  For i = 0 To n - 1
    Console.Write(answer(i) & " ")
  Next
  Console.ReadLine()
End Sub
