'Author Guy Gervais
Sub Main
    
    Dim input = <![CDATA[
75 64181 64174 15538 14
157 788 55670 55349 15
77 217 2624 337 13
131 6973 5 0 24
149 2750 827 649 22
869 282414 900259 729372 25
53 79 333 73 4
25 5 127 45 23
1885 19 96053 850 11
187 3748 44235 16054 3
1145 6305 34330 3914 9
63 50744 59 24 7
1175 767 3843 447 24
157 12 68 9 21
193 137272 989592 421558 4
43 5852 97 75 7
327 88916 696 14 22
]]>.Value()

    dim ans =""
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        dim p = line.split(" "c).tolist.select(function(x) cint(x)).tolist
        dim lcg = new LCG(p(0), p(1), p(2), p(3))
        for i = 1 to p(4) - 1
            lcg.getnext
        next
        ans = ans & lcg.getnext & " "
    next
    ans.dump
    
End Sub

class LCG
    property A as integer
    property C as integer
    property M as integer
    property X as integer
    sub new(A as integer, C as integer, M as integer, X0 as integer)
        _A = A : _C = C : _M = M : _X = X0
    end sub
    function GetNext() as integer
        _X = (A * _X + C) mod M
        return _X
    end function
end class


