//Author gunsmoke
#include <cmath>
#include <iostream>
#include <limits>
#include <sstream>
#include <string>

// the golden ratio, needed for determining the index of the number in the
// Fibonacci sequence
constexpr double kPhi = 1.6180339887498948482;

int get_fib_idx(std::string number);
int get_small_fib_idx(double value);
int get_large_fib_idx(double value, int skipped_digits);

int main() {
  int num_of_tests = 0;
  std::cin >> num_of_tests;
  std::cin.ignore();

  for (; num_of_tests > 0; --num_of_tests) {
    std::string line;
    std::getline(std::cin, line);
    std::cout << get_fib_idx(line) << ' ';
  }
}

/**
 * @brief      Computes the index for an arbitarily sized Fibonacci number
 *
 * @param[in]  number  A string containing the decimal value of the number
 *
 * @return     The index of the number in the Fibonacci sequence
 */
int get_fib_idx(std::string number) {
  int large_digit_count = std::numeric_limits<double>::digits10 - 1;
  double value = 0;
  int fib_idx = 0;
  int number_size = static_cast<int>(number.size());

  // check if the number fits in a double
  if (number_size < large_digit_count) {
    std::istringstream iss{number};
    iss >> value;
    fib_idx = get_small_fib_idx(value);
  } else {
    std::istringstream iss{number.substr(0, large_digit_count)};
    iss >> value;
    fib_idx = get_large_fib_idx(value, number_size - large_digit_count);
  }
  return fib_idx;
}

/**
 * @brief      Computes the index for a small Fibonacci number (one that can fit
 *             in a double)
 *
 * @param[in]  value  The Fibonacci number
 *
 * @return     The index of the number in the Fibonacci sequence
 */
int get_small_fib_idx(double value) {
  // return the value if it is less than 2
  if (value < 2) {
    return static_cast<int>(value);
  }
  // if the value of the Fibonacci number is known its index can be computed
  // with the following formula where kPhi is the golden ratio
  // (works for value > 1)
  return std::floor(std::log(value * std::sqrt(5) + 0.5) / std::log(kPhi));
}

/**
 * @brief      Computes the index for a large Fibonacci number (one that cannot
 *             fit in a double)
 *
 * @param[in]  value           The first n digits in the Fibonacci number (where
 *                             n is less than number of digits that will fit in
 *                             a double)
 *
 * @param[in]  skipped_digits  The number of digits in the Fibonacci number that
 *                             were not included in the value
 *
 * @return     The index of the number in the Fibonacci sequence
 */
int get_large_fib_idx(double value, int skipped_digits) {
  /*
   * Note: to improve readability the base of the logs here will be kPhi unless
   * denoted otherwise.
   *
   * The formula for the index is roughly:
   *   log(Fib * sqrt(5) + 0.5)
   *
   * for large Fib numbers the impact of the 0.5 term is negligible and it can
   * be removed:
   *   log(Fib * sqrt(5))
   *
   * the Fib can be broken up into two factors:
   *   log(value * (10^skipped_digits) * sqrt(5))
   *
   * using the logarithmic identity that states the sum of a log is the log of a
   * product it can be rearranged to:
   *   log(value) + log(10^skipped_digits) + log(sqrt(5))
   *
   * using the logarithmic identity for base changes it can be changed to:
   *   log(value) + log_10(10^skipped_digits)/log(10) + log(sqrt(5))
   *
   * using the logarithmic identity for powers it becomes:
   *   log(value) + skipped_digits * log_10(10)/log(10) + log(sqrt(5))
   *
   * or:
   *   log(value) + skipped_digits/log(10) + log(sqrt(5))
   */
  double idx = 0;
  idx = std::log(value) / std::log(kPhi);
  idx += static_cast<double>(skipped_digits) / std::log10(kPhi);
  idx += std::log(std::sqrt(5)) / std::log(kPhi);
  return static_cast<int>(std::round(idx));
}
