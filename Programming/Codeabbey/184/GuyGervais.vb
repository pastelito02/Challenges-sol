'Author Guy Gervais
sub main
    for each line in input().Split(cchar(vbLf))
        dim t = line.split(" "c).toArray
        dim M = cint( t(0)), K = cint( t(1)), inv = t(2) = "i", R = M mod (K+1)
        if inv then if R = 0 then R = K else r -= 1
        console.write(R & " ")
    next
end sub