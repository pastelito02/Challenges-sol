--Author tinbtinb
local op=assert(io.open("op.txt", "w"));

local binaryNumber={};
function binaryNumber:new (t)
  local t=t or {};
  setmetatable(t, self);
  self.__index=self
  return t;
end

function binaryNumber:flip ()
  for i=1, #self do
    self[i]=self[i]~1;
  end
end

function binaryNumber:carry ()
  local len=#self;
  for i=len, 2, -1 do
    if self[i]>1 then
      self[i]=0;
      self[i-1]=self[i-1]+1;
    end
  end
  if self[1]>1 then
    self[i]=0;
    table.insert(self, 1, 1);
  end
end

function binaryNumber:convert(n)
  local res, t={}, math.abs(n);
  while t~=0 do
    table.insert(res, 1, t%2);
    t=math.floor(t/2);
  end
  while #res <32 do
    table.insert(res, 1, 0);
  end
  res=self:new(res);
  if n<0 then
    res:flip();
    res[#res]=res[#res]+1;
    res:carry()
  end
  return res;
end

local n=io.read("n");
for i=1, n do
  local a=io.read("n");
  if a>2147483647 then a=-4294967296+a;
  elseif a<-2147483648 then a=4294967295+a; end
  local b=binaryNumber:convert(a);
  local count=0;
  for _, v in ipairs(b) do
    if v==1 then    count=count+1;    end
  end
  op:write(count, " ");
end
