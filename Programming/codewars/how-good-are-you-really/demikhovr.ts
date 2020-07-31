export const betterThanAverage = (classPoints: number[], yourPoints: number) =>
  classPoints.reduce((acc, it) => acc + it, 0) / classPoints.length <=
  yourPoints;
