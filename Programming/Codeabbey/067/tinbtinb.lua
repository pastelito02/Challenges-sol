--Author tinbtinb
local op=assert(io.open("op.txt", "w"));

--metatable for adding two numbers stored in tables
local addTwoTable={__add=
  function (a, b)
    local i, j, res=#a, #b, {};
    while i>0 do
      res[i]=a[i]+(b[j] or 0);
      i, j=i-1, j-1;
    end
    --apply carry
    for i=#res, 2, -1 do
      if res[i]>9 then
        res[i-1]=res[i-1]+math.floor(res[i]/10);
        res[i]=res[i]%10;
      end
    end
    if res[1]>9 then
      table.insert(res, 1, math.floor(res[1]/10));
      res[2]=res[2]%10;
    end
    --
    return res;
  end};
--generate fibonacci table
local ftable={};
function generateFtable ()
  ftable[0]=setmetatable({0}, addTwoTable);
  ftable[1]=setmetatable({1}, addTwoTable);
  for i=2, 1000 do
    ftable[i]=setmetatable(ftable[i-1]+ftable[i-2], addTwoTable);
  end
end
--main
local n=io.read("*n", 1);
generateFtable();

for i=1, n do
  local inptable, inp={}, io.read("*l");
  inp:gsub("(%d)", function (c) table.insert(inptable, tonumber(c)) end)
  local inpLen=#inptable;
  for j=0, 1000 do
    local isMatch=true;
    if inpLen<#ftable[j] then break;
    elseif inpLen==#ftable[j] then
      if ftable[j][1]>inptable[1] then break; end
      for k=2, inpLen do
        if ftable[j][k] ~=inptable[k] then isMatch=false; break; end
      end
      if isMatch==true then op:write(j, " "); end
    end
  end
end
