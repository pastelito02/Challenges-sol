'Author Guy Gervais
Sub Main

    Dim input = <![CDATA[
SS SR RP SP SS RP PR RR RR PR PR
SS RP SS SR SS RR SS SR
SP RP PR PS PR SR RR SR PP RP
PR RP RR RR PS SS SR PR SP PS
SR PS PS PS
SR PR PP PP SS RS PR
SR SP SS SP RR PP RS
PS PS SS PR PR SS SP SS PS SS PS
RS SP PS PS PR RR RS PR
SR RP SS PP SP RR RS PS SR
SP RR PR RS RS
PP PP RR RP PR SS RS SS SP
RR RR RS PP SP RS SP RP SR SR SS RP SR RS RS
RS SP RS SP PR
RR PR PR PR RR SP SS SR PS SS RP SP
PR SR PS RP RP SR
SP RP SR PS RS PS SP RP RS RR SR
PP RP RS PR SS PP SP SP PP RR RS
SS PR RR PS SR SR RS SP PS SS PR PR
RP RR RP RR RR RP PR RP SP SP RR SR
SS RR SS RP SP PP PP SS SR RS RS SP PR SP
SP RP SR PP PS PR PR SR
]]>.Value()
    
    dim ans = ""
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        
        dim games = line.split(" "c).tolist
        
        dim p1 = 0
        dim p2 = 0
        
        for each game in games
            select case game
                case "SS", "PP", "RR" ' draws
                case "PR", "RS", "SP" : p1 +=1 ' p1 wins
                case "RP", "SR", "PS" : p2 +=1 ' p2 wins
            end select
        next
        
        ans &= If( p1 > p2, "1 ", "2 ")
        
    next
    ans.dump
    
End Sub