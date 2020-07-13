'Author Guy Gervais
Sub Main

    Dim input = <![CDATA[
19 15 14 19 9 3
...
13 16 15 2 20 5
]]>.Value()
    
    dim ans = ""
    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    for each line in lines
        dim nums = line.split(" "c).tolist.select(function(x) cint(x)).tolist

        dim p1 = new point(nums(0), nums(1))
        dim p2 = new point(nums(2), nums(3))
        dim p3 = new point(nums(4), nums(5))
        
        ans &= distToSegment(p3, p1, p2) & " "
        
    next
    ans.dump
    
End Sub

class point
    property x as double
    property y as double
    sub new(x, y)
        _x = x
        _y = y
    end sub
end class

' from http://stackoverflow.com/questions/849211/shortest-distance-between-a-point-and-a-line-segment

function sqr(x as double) as double
    return x*x
end function

function dist2(v as point, w as point) as double
    return sqr(v.x - w.x) + sqr(v.y - w.y)
end function

function distToSegmentSquared(p as point, v as point, w as point) as double
    dim l2 = dist2(v, w)
    if l2 = 0 then return dist2(p, v)
    dim t = ((p.x - v.x) * (w.x - v.x) + (p.y - v.y) * (w.y - v.y)) / l2
    if t<0 then return dist2(p, v)
    if t>1 then return dist2(p, w)
    return dist2(p, new point(v.x + t * (w.x - v.x), v.y + t * (w.y - v.y)))
end function

function distToSegment(p as point, v as point, w as point) as double
    return Math.sqrt(distToSegmentSquared(p, v, w))
end function