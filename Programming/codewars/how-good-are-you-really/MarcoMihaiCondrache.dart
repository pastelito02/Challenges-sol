bool betterThanAverage(List<int> classPoints, int yourPoints) {
  double average = classPoints.fold(0, (prev, element) => element+prev) / classPoints.length;
  return yourPoints > average;
}
