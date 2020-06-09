'Author Guy Gervais
Sub Main

    Dim input = <![CDATA[
J 4 A T
K A
A K
Q Q
A A 6
A 5
T 5 7
J 5 7
J A
4 4 2 2 T
A T
6 A
8 5 A A A
3 6 K
Q K
T 7
8 9
A 8
6 3 4 9
K A
]]>.Value()
    
    dim ans = ""
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        dim cards = line.replace("A", "Z").split(" "c).tolist ' Aces will be Z; sort will place them last.
        cards.sort
        dim score = 0
        for each c in cards
            select case c
                case "Z" : score += if(score <= 10, 11, 1)
                case "T", "J", "Q", "K" : score += 10
                case else : score += val(c)
            end select            
        next
        ans &= If(score > 21, "Bust", score) & " "
    next
    ans.dump
    
End Sub