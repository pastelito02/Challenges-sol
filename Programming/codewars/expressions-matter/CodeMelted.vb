'CodeMelted
Public Module Kata
    Public Function ExpressionMatter(ByVal a As Integer, ByVal b As Integer, ByVal c As Integer) As Integer
        Dim vals As Integer() = {a + b + c, a * b * c, (a + b) * c, a * (b + c)}

        Dim largest As Integer = Integer.MinValue
        Dim smallest As Integer = Integer.MaxValue

        For Each element As Integer In vals
            largest = Math.Max(largest, element)
            smallest = Math.Min(smallest, element)
        Next
        return largest
    End Function
End Module
