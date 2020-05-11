--Author memstick
assert(#arg>2)
assert(#arg>=2*tonumber(arg[1])+1)

local function dist(p1, p2)
  return math.sqrt((p2[2]-p1[2])^2 + (p2[1]-p1[1])^2)
end

local function area(a,b,c)
  local s = (a+b+c)/2.0
  return math.sqrt(s*(s-a)*(s-b)*(s-c))
end

local poly = {}
for i=2,#arg,2 do
  poly[#poly+1] = {tonumber(arg[i]), tonumber(arg[i+1])}
end

local sum = 0
for i=2,#poly-1 do
  sum = sum + area(dist(poly[1], poly[i]), dist(poly[i], poly[i+1]), dist(poly[i+1], poly[1]))
end
print(sum)
