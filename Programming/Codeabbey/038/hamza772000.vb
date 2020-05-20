'Author hamza772000
Imports System.IO
Module Module1

    Sub Main()
        Dim file As System.IO.StreamWriter
        file = My.Computer.FileSystem.OpenTextFileWriter("C:\Users\hamza.DESKTOP-8DJLPME\Desktop\test.txt", True)


        Dim u As Double
        Dim v As Double
        Dim str As String = ""
        Dim nums As Integer = Console.ReadLine()
        Dim a As Integer
        Dim b As Integer
        Dim c As Integer
        Dim quad As String
        Dim nquad As Double
        Dim ansstr As String = ""
        Dim var As String
        Dim var2 As String
        Dim arr(1) As Double
        For i As Integer = 1 To nums
            Dim x As String = Console.ReadLine()
            Dim arr1() As String = x.Split(" ")
            a = CInt(arr1(0))
            b = CInt(arr1(1))
            c = CInt(arr1(2))
            Dim root As Double = 4 * a * c
            Dim com As Double = Math.Pow(b, 2) - (root)
            If com < 0 Then
                com = -1 * com
                u = ((-1 * b) / (2 * a))
                v = (Math.Sqrt(com) / (2 * a))
                'quad = ((-b) / 2 & "+" & Math.Sqrt((arr(0) / 2))) & "i"
                'Console.WriteLine(u & "+ " & (v) & "i")

                'Console.WriteLine(GCD(Math.Abs(u), Math.Abs(v)))
                'var = u / Math.Abs(GCD(u, v)) & "+" & (v) / Math.Abs(GCD(u, v)) & "i"
                'var2 = u / Math.Abs(GCD(u, v)) & "-" & (v) / Math.Abs(GCD(u, v)) & "i"
                var = u & "+" & v & "i"
                var2 = u & "-" & v & "i"
                ansstr = var & " " & var2 & ";"
                'str &= quad & "i " & nquad & "i"
                file.WriteLine(ansstr)
                'Console.WriteLine(Environment.NewLine & "Answer: " & ansstr & Environment.NewLine)
            Else
                quad = ((-b) + Math.Sqrt(com)) / (2 * a)
                nquad = ((-b) - Math.Sqrt(Math.Pow(b, 2) - (root))) / (2 * a)
                str = quad & " " & nquad & ";"
                file.WriteLine(str)
            End If

        Next
        file.Close()
        Console.ReadLine()
    End Sub
    '    Function GCD(ByVal a As Double, ByVal b As Double) As Double
    '        Dim remainder As Double



    '        Do
    '            remainder = a Mod b
    '            a = b
    '            b = remainder

    '        Loop Until remainder = 0
    '        Return a

    '    End Function

End Module