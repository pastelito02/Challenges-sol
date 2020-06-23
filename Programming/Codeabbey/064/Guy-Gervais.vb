'Author Guy Gervais
Sub Main

    Dim input = <![CDATA[
37 21
1111111110101111101011101111101111111
0000001000101010001000101000000000100
1010101110111011101111111011111110111
1010101000000010000000001010000010001
1010111110101111111011101011101111101
1010100000101010101000101010000010101
1111101010111010101111111111101110111
0010001010100000100010000000100000000
1011111111101111111011101011111110111
1000001010001000001010101000001000001
1011111011101010111010101110111011101
1010000010000010000010000010101010101
1111101011101111111010101110101110111
0000101010000010101000101000001000001
1111111011101010101111101011101111101
0010000010101010000010001010000010000
1110111110111110111110111010111110101
0010100010001010100010100010000010101
1110101111101010101110111110101111111
0010001010000010000000001010101000000
1111101011101111111111101011111111111
]]>.Value()

    ' Load grid to array    
    dim w = 0
    dim h = 0
    dim grid(,) as integer = nothing
    dim work(,) as integer = nothing
    dim gx = 0, gy = 0    
    
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        if line is lines.first then
            dim nums = line.split(" "c).tolist.select(function(q) cint(q)).tolist    
            w = nums(0)-1    : h = nums(1)-1
            redim grid(h, w)
            redim work(h, w)
        else
            for each c in line
                grid(gy, gx) = val(c)
                gx += 1
            next
            gy += 1 : gx = 0
        end if
    next
    
    dim ans = ""
    CopyGrid(grid, work) : ans &= GetPath(work, 0, w, 0, 0) & " "
    CopyGrid(grid, work) :    ans &= GetPath(work, h, 0, 0, 0) & " "
    CopyGrid(grid, work) :    ans &= GetPath(work, h, w, 0, 0)
    ans.dump
    
End Sub

sub CopyGrid(Of T)(src(,) as T, byref dest(,) as T)
    for y = 0 to src.GetLength(0)-1
        for x = 0 to src.GetLength(1)-1
            dest(y, x) = src(y, x)
        next
    next
end sub

function GetPath(work(,) as integer, sy as integer, sx as integer, ty as integer, tx as integer) as string
    dim h = work.GetLength(0)-1
    dim w = work.GetLength(1)-1
    dim y = sy, x = sx ' start
    work(y,x) = -1
    do
        for j = 0 to h
            for i = 0 to w
                if work(j,i) < 0 then
                    if j > 0 then if work(j-1, i) > 0 then work(j-1, i) = work(j,i)-1
                    if j < h then if work(j+1, i) > 0 then work(j+1, i) = work(j,i)-1
                    if i > 0 then if work(j, i-1) > 0 then work(j, i-1) = work(j,i)-1
                    if i < w then if work(j, i+1) > 0 then work(j, i+1) = work(j,i)-1
                end if
            next
        next
    loop until work(ty,tx) < 1 ' target
    
    ' backtrack from target to start
    y = ty : x = tx
    dim path = ""
    do
        if y > 0 then if work(y-1, x) = work(y, x)+1 then path = "D" & path : y -= 1 : continue do
        if x < w then if work(y, x+1) = work(y, x)+1 then path = "L" & path : x += 1 : continue do
        if y < h then if work(y+1, x) = work(y, x)+1 then path = "U" & path : y += 1 : continue do
        if x > 0 then if work(y, x-1) = work(y, x)+1 then path = "R" & path : x -= 1 : continue do    
    loop until( y=sy and x=sx)
    
    return compress(path, math.max(w,h))

end function

function compress(path as string, maxlen as integer) as string
    for each d in {"D","L","R","U"}
        for i = maxlen to 2 step -1
            path = path.replace(new string(d, i), i & d)            
        next
    next
    return path
end function