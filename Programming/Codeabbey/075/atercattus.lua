--Author atercattus
for cnt = io.read('*n'), 1, -1 do
  local dices = {io.read('*n'), io.read('*n'), io.read('*n'), io.read('*n'), io.read('*n')}
  table.sort(dices)

  local s15, s26 = true, true
  local cnts = {['_']=0}
  for i = 1, #dices do
    s15 = s15 and (i     == dices[i])
    s26 = s26 and (i + 1 == dices[i])
    cnts[dices[i]] = (cnts[dices[i]] or 0) + 1
  end

  local max, pair, three = 0, 0, 0
  for i,cnt in pairs(cnts) do
    max = math.max(max, cnt)
    if cnt == 2 then
      pair = pair + 1
    elseif cnt == 3 then
      three = three + 1
    end
  end

  local names = {'none', 'pair', 'three', 'four', 'yacht'}

  io.write(
    s26 and 'big-straight' or (
      s15 and 'small-straight' or (
        (pair > 0 and three > 0) and 'full-house' or (
          (pair > 1) and 'two-pairs' or (
            names[max]
          )
        )
      )
    ),
    ' '
  )
end
