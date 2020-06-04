'Author Guy Gervais
sub main
    dim v = input.split(vblf).select(function(x) BigInteger.Parse(x))
    dim n = v(0), cipher = v(1), e = 65537

    ' Fermat factorization method
    dim a = sqrt(n), b = BigInteger.Zero
    do
        b = a * a - n
        dim c = sqrt(b)
        if c * c = b then exit do
        a += 1
    loop
    b = sqrt(a * a - n)
    dim p = (a-b)
    dim q = (a+b)

    ' The rest is the same as RSA problem...
    dim phi = n - p - q + 1
    dim d = ModInv(e, phi)
    dim t = BigInteger.ModPow(cipher, d, n).toString
    for i = 0 to t.length-1 step 2
        debug.write(chr(val(t.substring(i, 2))))
    next
    
end sub