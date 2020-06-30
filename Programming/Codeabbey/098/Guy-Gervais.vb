'Author Guy Gervais
Sub Main

    Dim input = <![CDATA[
go 240 feet by azimuth 308
...
go 320 feet by azimuth 331
]]>.Value()
    
    dim ans = ""
    dim x=0R, y=0R ' origin
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        dim tokens = line.split(" "c).tolist
        dim feet = tokens(1)
        dim azim = tokens(5) ' mighty fancy word for angle you got there capt'n
        
        ' Calculate angle and apply distance
        dim angleRad = azim * Math.PI / 180 ' to radians
        x = x + feet * math.sin(angleRad)
        y = y + feet * math.cos(angleRad)
        
    next
    ans = math.round(x) & " " & math.round(y)
    ans.dump
    
End Sub