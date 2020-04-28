-- Author ferchoafta --
local testString = "ABRACADABRA"

local function strToTable(str)
  tmpTable={}
  str:gsub(".", function(c,d)
                  tmpC  = {c, 1, 0}
                  table.insert(tmpTable,tmpC)
                  curSize = #tmpTable
                end)
  return tmpTable
end

function table.setCount(tmpTable)
  acom = 0
  for i = 1, #tmpTable do
    acom = acom + tmpTable[i][2]
    tmpTable[i][3] = acom
  end
end
function table.resetCount(tmpTable,lastCount)
  for i = 1 , #tmpTable do
    tmpTable[i][3] = - tmpTable[i][3] - lastCount
  end
end

function table.group(tmpTable)
  local iterator = 1
  local total = 0
  while iterator <= #tmpTable do

    local iterator2 = iterator + 1
    while iterator2 <= #tmpTable do
      if (tmpTable[iterator][1] == tmpTable[iterator2][1]) then
        tmpTable[iterator][2] = tmpTable[iterator][2] + 1
        table.remove(tmpTable, iterator2)
      else
        iterator2 = iterator2 + 1
      end

    end

    iterator = iterator + 1

  end

  return tmpTable
end


function table.reverse(tmpTable)
  newTable = {}
  for i = #tmpTable ,1 ,-1 do
    table.insert(newTable,tmpTable[i])
  end
  return newTable
end

function table.resetCountTable(tmpTable, countToRemove)
  for i = 1, #tmpTable do
    tmpTable[i][3] = tmpTable[i][3] - countToRemove
  end
end
function table.getSplitInTheMiddle(tmpTable)
  local sizeTable = #tmpTable
  local total =  tmpTable[sizeTable]

  local sumRightToLeft = 0
  local leftTable = {}
  local rightTable = {}
  local removeNumber = 0
  if (#tmpTable > 1 ) then
    for i = sizeTable, 1, -1 do
      sumRightToLeft = sumRightToLeft + tmpTable[i][2]
      if sumRightToLeft > tmpTable[i][3] then
        table.insert(leftTable,tmpTable[i])
      else

        table.insert(rightTable,tmpTable[i])
      end

    end
  end

  leftTable = table.reverse(leftTable)
  rightTable = table.reverse(rightTable)
  removeNumber = 0
  if ( leftTable[#leftTable] ~= nill ) then

    removeNumber = leftTable[#leftTable][3]
  end
  table.resetCountTable(rightTable,removeNumber)
  return {leftTable, rightTable}
end

function print_r(arr, indentLevel)
    local str = ""
    local indentStr = "#"

    if(indentLevel == nil) then
        print(print_r(arr, 0))
        return
    end

    for i = 0, indentLevel do
        indentStr = indentStr.."\t"
    end

    for index,value in pairs(arr) do
        if type(value) == "table" then
            str = str..indentStr..index..": \n"..print_r(value, (indentLevel + 1))
        else
            str = str..indentStr..index..": "..value.."\n"
        end
    end
    return str
end


function orderByCount(a,b)
  return a[2] > b[2]
end

function orderLogic(a,b)
  if a[2] ~= b[2] then
    return a[2] > b[2]
  end

  return a[1] < b[1]
end
function printTableInLine(tmpTable)
  for i = 1, #tmpTable do
    if(tmpTable[i] ~= nill) then
      io.write(tmpTable[i])
     end
  end
end
function recursiveShannonFano(tmpRightLeftTable, level, way)

  level = level + 1

  local leftTable = tmpRightLeftTable[1]
  local rightTable = tmpRightLeftTable[2]
  --print_r(rightTable)

  if #leftTable > 0 then
      way[level] = 'O'
      way[level+1] = nil
      if(#leftTable == 1) then
        io.write(string.byte(leftTable[1][1]))
        io.write(" ")
        printTableInLine(way)
        io.write(" ")
      else
        leftTableSplited = table.getSplitInTheMiddle(leftTable)
        recursiveShannonFano(leftTableSplited,level,way)
      end

  end

  if rightTable[1] ~= nil then

      way[level] = 'I'
      way[level+1] = nil

      if(#rightTable == 1) then
         io.write(string.byte(rightTable[1][1]))
         io.write(" ")
         printTableInLine(way)
         io.write(" ")
      else

      rightTableSplited = table.getSplitInTheMiddle(rightTable)
      recursiveShannonFano(rightTableSplited, level, way)

    end
  end
  return true
end

local function main()
  -- Preparing the string
  local shannonTable = strToTable([[before this gentleman anything which you may say to me." "You have really got it!" he cried, grasping Sherlock Holmes by society with his whole Bohemian soul, remained in our lodgings in you made me reveal what you wanted to know. Even after I became remarkably animated. There was a group of shabbily dressed men]])
  -- local shannonTable = strToTable("ABRACADABRA")
  local way = {}
  table.group(shannonTable)
  table.sort(shannonTable,orderLogic)
  table.setCount(shannonTable)

  RightLeftTable = table.getSplitInTheMiddle(shannonTable)


  recursiveShannonFano(RightLeftTable, 1, way)

end

local function test()
  -- Preparing the string
  local shannonTable = strToTable("")

  table.group(shannonTable)
  -- table.sort(shannonTable,orderByCount)
  table.sort(shannonTable,orderLogic)

  print("split line ordernering")
  for i = 1, #shannonTable do
    print(shannonTable[i][1] .. " " .. shannonTable[i][2].. " " .. shannonTable[i][3])
  end
end


function UT_table_plitInTheMiddle()
  local shannonTable = strToTable("D")
  --RCDRD
  table.group(shannonTable)
  table.sort(shannonTable,orderLogic)
  table.setCount(shannonTable)
  print("start split")
  shannonTable = table.getSplitInTheMiddle(shannonTable)
  print("end split")
  print(#shannonTable)
  right = shannonTable[2]
  left  = shannonTable[1]

   print("left")
  for i = 1, #left do
    print(left[i][1] .. " " .. left[i][2].. " " .. left[i][3])
  end

  print("right")
  for i = 1, #right do
    print(right[i][1] .. " " .. right[i][2].. " " .. right[i][3])
  end

  print("---")
end


-- print("Start correctly")
--UT_table_plitInTheMiddle()
main()
-- test()

-- print("Finish correctly")
