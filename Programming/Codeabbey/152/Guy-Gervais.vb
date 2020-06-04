'Author Guy Gervais
sub main    
    dim v = input.split(vblf).select(function(x) BigInteger.Parse(x))
    dim p = v(0), q = v(1), cipher = v(2), e = 65537
    dim n = p * q, phi = n - p - q + 1
    dim d = ModInv(e, phi)
    dim a = BigInteger.ModPow(cipher, d, n).toString
    for i = 0 to a.length-2 step 2
        debug.write(chr(val(a.substring(i, 2))))
    next
end sub