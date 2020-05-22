'Author Guy Gervais
        Dim input = <![CDATA[903 772 6239 7851 1022 2026 444 6690 381 8397 9251 3416]]>.Value()
        Dim seeds = input.Trim.Split(" "c).ToList
        For Each seed In seeds
            Dim hs = New HashSet(Of Integer)
            hs.Add(seed)
            Dim repetition As Boolean
            Dim iteration = 0
            Do
                iteration += 1
                repetition = False
                ' get next rnd in sequence
                Dim rnd = CInt(seed)
                rnd = rnd ^ 2
                Dim s = rnd.ToString("00000000")
                seed = s.Substring(2, 4)
                If hs.Contains(seed) Then repetition = True
                hs.Add(seed)
            Loop Until repetition
            Debug.Write(iteration & " ")
        Next