'Author Guy Gervais
Sub Main

    Dim input = <![CDATA[
30 324    
Electra 631 268
Diadem -810 391
Algol 917 -70
Polaris 82 -351
Unuk -384 -461
Alcor -815 -526
Gemma -439 661
Deneb 103 -697
Bellatrix -663 -877
Nembus -606 608
Yildun -165 -834
Vega -20 787
Mizar 726 325
Betelgeuse -114 -433
Media -192 -824
Kastra -630 -561
Sirius 444 -440
Fomalhaut 830 360
Albireo 491 -88
Kochab -992 -893
Rigel 451 -806
Jabbah -418 -989
Zosma 855 685
Procyon -685 -808
Mira 809 -291
Castor 801 -356
Capella -124 -220
Pherkad -570 -399
Altair -895 317
Thabit 168 -86
]]>.Value()
'Sirius Deneb Mira Algol
    
    dim stars = new list(of star)
    dim angle = 0R
    
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        dim tokens = line.split(" "c)
        if line is lines.first then            
            angle = tokens(1)
        else
            stars.add(new star with {.name = tokens(0), .x = tokens(1), .y = tokens(2)})
        end if
    next
    
    ' Rotate'em
    dim rad = angle * Math.PI / 180 ' angle in radians
    for each star in stars
        dim newx = star.x * Math.Cos(rad) - star.y * Math.Sin(rad)
        dim newy = star.x * Math.Sin(rad) + star.y * Math.Cos(rad)
        star.x = math.round(newx)
        star.y = math.round(newy)
    next
    
    dim ans = join(stars.orderby(function(q) q.y).thenby(function(p) p.x).select(function(r) r.name).toarray, " ")
    ans.dump
    
End Sub

class star
    property name as string
    property x as double
    property y as double
end class