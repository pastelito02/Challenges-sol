#Author tomasloksa
function stringtobin(f, codes)
    binary = ""
    for c in f
        binary *= codes[Char(c)]
    end
    diff = 8 - length(binary) % 8
    binary *= temp = repeat('0', diff)
    split(replace(binary, r"(.{8})" => s"\1 "))
end

function bintohex(binary)
    for bin in binary
        answer = uppercase(string(parse(Int, bin, base = 2), base = 16))
        if length(answer) < 2
            answer = "0" * answer   #prefix with 0 if number is F or smaller
        end
        print(answer, " ")
    end
end

codes = Dict([(' ', "11"), ('e', "101"), ('t', "1001"), ('o', "10001"),
        ('n', "10000"), ('a', "011"), ('s', "0101"), ('i', "01001"),
        ('r', "01000"), ('h', "0011"), ('d', "00101"), ('l', "001001"),
        ('!', "001000"), ('u', "00011"), ('c', "000101"), ('f', "000100"),
        ('m', "000011"), ('p', "0000101"), ('g', "0000100"), ('w', "0000011"),
        ('b', "0000010"), ('y', "0000001"), ('v', "00000001"),
        ('j', "000000001"), ('k', "0000000001"), ('x', "00000000001"),
        ('q', "000000000001"), ('z', "000000000000")])  #Don't worry, used RegExr for this ^^
f = open("input.txt")
in = readline(f)
binary = stringtobin(in, codes)
bintohex(binary)
