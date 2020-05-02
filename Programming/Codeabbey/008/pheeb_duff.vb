'Author pheeb_duff
Dim length As Integer = Console.ReadLine()
    Dim sum(length - 1) As Integer
    Dim number(2) As String
    Dim A As Integer
    Dim B As Integer
    Dim N As Integer
    For i As Integer = 0 To length - 1
      Dim numbers As String = Console.ReadLine()
      For x As Integer = 0 To 2
        number = numbers.Split(" ")
      Next
      A = CInt(number(0))
      B = CInt(number(1))
      N = CInt(number(2))
      For x As Integer = 0 To N - 1
        sum(i) += A + (x * B)
      Next
    Next
    For i As Integer = 0 To length - 1
      Console.Write(sum(i) & " ")
    Next
