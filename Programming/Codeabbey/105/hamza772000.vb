'Author hamza772000
Module Module1

  Sub Main()
    Console.WriteLine("Please Enter the coordinate of the last vertex: ")
    Dim final As String = Console.ReadLine()
    Dim finalvert() As String = final.Split(" ")
    Dim areastring As String = ""
    Dim Area As Double = Nothing
    Dim S As Double
    Dim areasum As Double
    Console.WriteLine("Please Enter the number of vertices: ")
    Dim nums As Integer = Console.ReadLine()
    nums -= 1
    Console.WriteLine("Please Enter the coordinates of the vertices (two on each line and please enter the coordinates of the previous vertex on each line): ")
    Dim a() As String
    For i As Integer = 1 To nums
      Dim x As String = Console.ReadLine
      a = x.Split(" ")

      Dim A1 As Double = Math.Sqrt((Math.Pow((CInt(a(3) - a(1))), 2)) + (Math.Pow((CInt(a(2) - a(0))), 2)))
      Dim B1 As Double = Math.Sqrt((Math.Pow(CInt(a(3) - CInt(finalvert(1))), 2)) + (Math.Pow(CInt(a(2) - CInt(finalvert(0))), 2)))
      Dim C1 As Double = Math.Sqrt((Math.Pow(CInt(a(1) - CInt(finalvert(1))), 2)) + (Math.Pow(CInt(a(0) - CInt(finalvert(0))), 2)))
      S = (A1 + B1 + C1) / 2
      Area = Math.Sqrt(S * (S - A1) * (S - B1) * (S - C1))
      areastring &= Area & " "
      areasum += Area
    Next
    Console.WriteLine(Environment.NewLine & "The area of the convex polygon is: " & areasum)
    Console.ReadLine()
  End Sub

End Module
