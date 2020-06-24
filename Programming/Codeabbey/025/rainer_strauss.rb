#Author rainer_strauss
#
# p25.rb
# Linear Congruential Generator
#


data = "15
167 2 396 251 11
83 79 39 35 5
1067 2490 6888 3869 24
201 81633 71445 16356 8
689 919 98650 29037 23
107 6080 569197 416940 22
71 8 637713 425463 13
839 41 6 3 17
1977 5825 862287 394314 10
41 201564 65160 1864 20
227 9065 18572 6928 11
1321 72672 43 16 3
191 3831 5710 3964 6
131 851 38 23 7
47 3 480 288 24
".split("\n")[1..-1]

result = ''

data.each do |v|
  a, c, m, x, n = v.split(' ').map {|e| e.to_i}

  n.times do
    x = (a * x + c) % m
  end

  result += x.to_s + ' '

end

puts result
