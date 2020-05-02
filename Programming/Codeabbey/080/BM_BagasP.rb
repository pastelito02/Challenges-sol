#Author BM_BagasP
hasil = []
data = gets

for i in 0..data do
  a = 0
  b = 0
  x = gets
  x_split = x.split(',')
  x_map = x_split.map(Integer)

  for j in 0..x_map do
    x_map = j*0.01000

  pA = x_map[0]
  pB = x_map[1]

  z = ((pB) * (1-pA))

  for k in 1..10 do
    b += z
    z *= ((1-pB)*(1-pA))

  pA = (1 - b) * 100
  pA = pA.round
  hasil.push(pA.map(Integer))

puts " " + hasil.map(String)
