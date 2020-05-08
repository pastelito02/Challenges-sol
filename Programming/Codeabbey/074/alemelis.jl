#Author alemelis
data = split("3
12:00 15:00 9:30", "\n")

iterator = int(data[1])

hours = split(data[2], " ")

O = 10.
H = 6.
M = 9.

for i in 1:iterator
  hh, mm = float(split(hours[i], ":"))

  alpha = (90 - 360/12 * ((hh%12) + 1/60 * (mm%60))) * pi/180
  beta  = (90 - 360/60 * (mm%60)) * pi/180

  hx = O + H*cos(alpha)
  hy = O + H*sin(alpha)

  mx = O + M*cos(beta)
  my = O + M*sin(beta)

  @printf "%.8f %.8f %.8f %.8f\n" hx hy mx my
end
