--vladshyrinov
local kata = {}

function kata.positive_sum(arr)
  local sum = 0

  for idx, val in pairs(arr) do
    if val > 0 then sum = sum + val end
  end

  return sum
end

return kata
