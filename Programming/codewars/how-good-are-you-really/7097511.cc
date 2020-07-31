#include <vector>
#include <numeric>

bool betterThanAverage(const std::vector<int>& classPoints, const int yourPoints) {
  return std::accumulate(classPoints.cbegin(), classPoints.cend(), 0) < classPoints.size() * yourPoints;
}
