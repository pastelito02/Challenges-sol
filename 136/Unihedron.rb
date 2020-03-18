#Author  Unihedron
a= eval "{' ': 11          ,   'e': 101,
't': 1001          , 'o': 10001,
'n': 10000     ,     'a': 011,
's': 0101        ,   'i': 01001,
'r': 01000       ,   'h': 0011,
'd': 00101     ,     'l': 001001,
'!': 001000    ,     'u': 00011,
'c': 000101       ,  'f': 000100,
'm': 000011       ,  'p': 0000101,
'g': 0000100   ,     'w': 0000011,
'b': 0000010      ,  'y': 0000001,
'v': 00000001     ,  'j': 000000001,
'k': 0000000001    , 'x': 00000000001,
'q': 000000000001  , 'z': 000000000000}".gsub(/(:)|\d+/){$1 ? '=>' : "'#$&'"}
a=a.invert
c=($<.chars.map{|x|'0123456789ABCDEFGHIJKLMNOPQRSTUV'.index(x).to_s(2).rjust(5,?0)}*'').chars
puts c.each_with_object({t:'',o:[]}){|c,s|(
s[:o]<<a[s[:t]]
s[:t]=''
) if a.has_key? s[:t]<<c}[:o]*''
exit
puts ($<.chars.map{|x|a[x]}*'').chars.each_slice(4).map{|x|''[x.reduce(0){|x,y|(x<<1)+y.to_i}]}.each_slice(2).map(&:join).join(' ')
