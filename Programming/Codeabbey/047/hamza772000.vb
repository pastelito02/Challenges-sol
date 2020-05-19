'Author hamza772000
Imports System.IO
Imports System.Text.RegularExpressions
Module Module1

    Sub Main()
        Dim file As StreamWriter
        'file = My.Computer.FileSystem.OpenTextFileWriter("C:\Users\hamza.DESKTOP-8DJLPME\Downloads", True)
        Console.WriteLine("Please enter the number of runs:")
        Dim nums As Integer = Console.ReadLine()
        Dim space As String = ""
        Console.WriteLine("Please enter key:")
        Dim key As Integer = 26 - Console.ReadLine()
        Dim test As String = ""
        Dim x As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Dim alphabet As String = x.ToCharArray
        For l As Integer = 1 To nums
            Console.WriteLine()
            Dim input As String = Console.ReadLine
            Dim intake As String = input.ToCharArray
            'For Each element As Char In input
            '    If element = " " Then
            '        Console.Write(" ")
            '    End If

            For q As Integer = 0 To intake.Length - 1
                test = x.IndexOf(intake(q))
                If intake(q) = " " Then
                    Console.Write(" ")
                ElseIf intake(q) = "." Then
                    Console.WriteLine(".")
                Else
                    Console.Write(x.ElementAt(CDbl(test) + key))
                End If

            Next


        Next

        'Next
     
        Console.ReadLine()
    End Sub

End Module
