'Author Guy Gervais
Sub Main ' LINQPad 4
    dim arr = "187 176 82 39 73 105 97 89 34 125 65 135 103 32 108 5 4 140 183 101 62 120 68 107 131 194 86 115 38 197 112 110 102 9 199 136 134 124 198 122 28 31 35 171 16 33 27 129 113 100 167 13 78 21 77 149 155 154 186 185 18 133 20 189 23 85 158 162 153 156 188 83 69 88 50 179 127 191 141 15 56 74 49 36 63 190 48 106 119 174 168 25 96 145 146 24 169 54 26 70 64 144 46 95 180 151 99 55 67 79 80 163 11 104 60 159 90 175 76 42 1 111 7".split(" "c).toList.select(function(x) cint(x)).toArray
    dim last = 0
    for i = 0 to arr.length-2
        last += 1
        dim max = -1, pos = -1, N = arr.length-last
        for j = 0 to N
            if arr(j) > max then max = arr(j) : pos = j
        next
        dim tmp = arr(N) : arr(N) = arr(pos) : arr(pos) = tmp ' swap
        debug.write(pos & " ")
    next
End Sub
