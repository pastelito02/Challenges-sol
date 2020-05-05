--Author tinbtinb
local op=assert(io.open("op.txt", "w"));

local n=io.read("n");
for i=1, n do
  local init, goal, rate=io.read("n", "n", "n");
  local count=0;
  while init<goal do
    count=count+1;
    init=tonumber(string.format("%.2f", init*(1+rate/100)));
  end
  op:write(count, " ");
end
