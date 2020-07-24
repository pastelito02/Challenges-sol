'attheturnstiie
Public Module Kata
    Public Function Past(ByVal h As Integer, ByVal m As Integer, ByVal s As Integer) As Integer
        Dim total As Integer
        total += (h * 3600000)
        total += (m * 60000)
        total += (s * 1000)
        Return total
    End Function
End Module
