'Author hamza772000
Module Module1

  Sub Main()
    Dim n As Integer = Console.ReadLine()
    Dim out As String = ""
    For i As Integer = 0 To n - 1
      Dim inp() As String = Console.ReadLine.Split(" ")
      out &= Math.Round(CInt(inp(0)) / Math.Tan((180 - CInt(inp(1))) * (Math.PI / 180))) & " "
    Next
    My.Computer.Clipboard.SetText(out.Trim)
    Console.ReadLine()
  End Sub

End Module
