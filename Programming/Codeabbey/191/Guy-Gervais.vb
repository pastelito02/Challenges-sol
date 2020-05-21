'Author Guy Gervais
sub main
    dim output = ""
    for each line in input.Split(cchar(vbLf))
        dim min = "", max = ""
        GetMinMax(line.toCharArray, min, max)
        output &= min & " " & max & " "
    next
    console.write(output.trim)
end sub

sub GetMinMax(hex as char(), byref smin as string, byref smax as string)
    dim min(hex.count-1), max(hex.count-1), test(hex.count-1) as char    
    array.copy(hex, min, hex.count) : array.copy(hex, max, hex.count)
    for c = 0 to hex.count-1
        for s = c+1 to hex.count-1
            array.copy(hex, test, hex.count)
            swap(test(s), test(c))
            if test(0) > "0"c then
                if cstr(test) < cstr(min) then array.copy(test, min, test.count)
                if cstr(test) > cstr(max) then array.copy(test, max, test.count)
            end if
        next
    next    
    smin = min : smax = max
end sub

sub swap(byref a as char, byref b as char)
    dim t = a : a = b : b = t
end sub