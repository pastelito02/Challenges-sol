'Author hamza772000
Module Module1

    Sub Main()
        Dim ans As String = ""
        Dim val As Integer = Nothing
        Dim dict As New Dictionary(Of String, Integer)()
        Dim seed As Integer = Console.ReadLine()
        Dim arr(900000) As String
        For i As Integer = 0 To arr.Length - 1
            arr(i) = generate(seed)
        Next
        Console.WriteLine("The most frequent word is: " & Mostfrequent(arr, dict))
        Console.ReadLine()
    End Sub
    Function generate(ByRef x As Integer)
        Dim words As String = ""
        Dim consonants As String = "bcdfghjklmnprstvwxz"
        Dim vowels As String = "aeiou"
        Dim arr1(5) As String
        Dim A, C, M, X0 As Integer
        A = 445
        C = 700001
        M = 2097152
        X0 = x

        For i As Integer = 0 To 6 - 1
            X0 = (A * X0 + C) Mod M
            arr1(i) = X0
        Next

        For i As Integer = 0 To arr1.Length - 1
            If i Mod 2 = 0 Then
                words &= consonants(arr1(i) Mod 19)
            Else
                words &= vowels(arr1(i) Mod 5)
            End If

        Next
        words &= " "

        x = X0
        words = words.Trim
        Return words
    End Function
    Function Mostfrequent(ByVal arr() As String, dict As Dictionary(Of String, Integer))
        Dim ans As String = ""
        Dim val As Integer

        For Each item As String In arr
            If Not dict.ContainsKey(item) Then
                dict.Add(item, 0)
            End If
            dict(item) += 1
        Next
        For Each item As KeyValuePair(Of String, Integer) In dict

            If item.Value > val Then
                ans = item.Key
                val = item.Value
            End If
        Next
        Return ans
    End Function
End Module
