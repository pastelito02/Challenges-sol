--Author tinbtinb
local op=io.open("op.txt", "w");

local n=io.read("n", 1);
for i=1, n do
  local s=io.read("l");
  local stack, flag={}, 1;
  s:gsub("([%[%]%(%)%{%}<>])",
  function (c)
    if flag==0 then return; end
    if c=='(' or c=='[' or c=='{' or c=='<' then
      table.insert(stack, c);
    elseif c==')' then
      if stack[#stack]=='(' then table.remove(stack);
      else flag=0; end
    elseif c==']' then
      if stack[#stack]=='[' then table.remove(stack);
      else flag=0; end
    elseif c=='}' then
      if stack[#stack]=='{' then table.remove(stack);
      else flag=0; end
    elseif c=='>' then
      if stack[#stack]=='<' then table.remove(stack);
      else flag=0; end
    end
  end);
  if #stack~=0 then flag=0; end
  op:write(flag, " ");
end
