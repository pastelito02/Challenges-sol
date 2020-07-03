'Author Guy Gervais
          Dim input = <![CDATA[2258 60 78730135 5 625635753 648049 76550648 884 90326 549 47294 608761 49683657 3724 8966 8130345 89 9530 4841203 59933 1 939710 98154962]]>.Value()
        Dim values = input.Trim.Split(" "c).Select(Function(x) CLng(x)).ToList
        Dim result = 0L
        For Each v In values
            result = ((result + v) * 113) Mod 10000007
        Next
        Debug.Write(result)