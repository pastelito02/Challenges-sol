'Author Guy Gervais
Sub Main
    for each line in testData.split(vblf)
        dim v = line.split(" ").select(function(n) clng(n)).toArray
        dim x = 0L, y = 0L, r = 0L    
        ExGCD(v(0), v(1), x, y, r)    
        debug.print(r & " " & x & " " & y)
    next
End Sub

sub ExGCD(a as long, b as long, byref x as long, byref y as long, byref d as long)
    if b = 0 then d = a : x = 1 : y = 0 : exit sub
    dim q = 0L, r = 0L, x2 = 1L, x1 = 0L, y2 = 0L, y1 = 1L    
    do while b > 0
        q = a \ b : r = a - q * b
        x = x2 - q * x1 : y = y2 - q * y1        
        a = b :    b = r
        x2 = x1 : x1 = x 
        y2 = y1 : y1 = y
      loop
      x = x2 : y = y2 : d = a
end sub
