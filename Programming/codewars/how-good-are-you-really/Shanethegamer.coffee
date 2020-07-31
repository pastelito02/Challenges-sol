betterThanAverage = (classPoints, yourPoints) ->
  yourPoints > classPoints.reduce((x, y) -> x + y)/classPoints.length
