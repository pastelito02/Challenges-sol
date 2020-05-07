'Author matthew_h
Imports System

Public Class Test
  Public Shared Sub Main()
    Dim i as Integer
    Dim Values()
    Dim Amount as Integer, Counter as Integer
    Dim Num as Long

    Amount = Console.ReadLine()
    Values = Console.ReadLine().Split(" ")

    For i = 0 to Amount - 1
      Num = Clng(Values(i))
      Counter = 0
      Do Until Num = 1
        if Num Mod 2 = 0 then
          Num = Num / 2
        else
          Num = Num * 3 + 1
        end if
        Counter += 1
      Loop
      Console.Write(Counter & " ")
    next i

  End Sub
End Class
