#Author BeastJLJ
def GetInputNumbers(sType)
  aNumbers = []
  aStringNumbers = gets.chomp.split(" ")
  for nIndex in 0...aStringNumbers.length
    if sType == "F"
      aNumbers << aStringNumbers[nIndex].to_f
    elsif sType == "I"
      aNumbers << aStringNumbers[nIndex].to_i
    end
  end
  return aNumbers
end
def Coordinates(aSetUp)
  aCoordinateList = []
  aCoordinates = [0, 0]
  aVelocities = [1, 1]
  nSteps = 0
  while true
    aCoordinateList << aCoordinates[0] << aCoordinates[1]
    if nSteps == 100
      break
    end
    aCoordinates[0] += aVelocities[0]
    aCoordinates[1] += aVelocities[1]
    if aCoordinates[0] == aSetUp[0] - aSetUp[2]
      aVelocities[0] = -1
    elsif aCoordinates[0] == 0
      aVelocities[0] = 1
    end
    if aCoordinates[1] == aSetUp[1] - 1
      aVelocities[1] = -1
    elsif aCoordinates[1] == 0
      aVelocities[1] = 1
    end
     nSteps += 1
  end
  return aCoordinateList
end
Coordinates(GetInputNumbers("I")).each { |nCoordinate| print "#{nCoordinate} " }
puts
