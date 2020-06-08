'Author Guy Gervais
        Dim input = <![CDATA[11 20 19 8 2 9 13 6 12 18 14 16 7 5 3 17 10 4 15 1]]>.Value()
        Dim values = input.Trim.Split(" "c).Select(Function(x) CInt(x)).ToArray

        ' Bubble sort
        Dim swapCount = 0
        Dim swapped = False
        Dim passes = 0
        Do
            swapped = False
            passes += 1
            For i = 0 To values.Count - 2
                Dim j = i + 1
                If values(i) > values(j) Then
                    swapCount += 1
                    swapped = True
                    Dim tmp = values(i)
                    values(i) = values(j)
                    values(j) = tmp
                End If
            Next
        Loop Until Not swapped
        Debug.Write(passes & " " & swapCount)
