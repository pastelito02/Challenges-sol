/*SlavaDaun*/
package kata

func PositiveSum(numbers []int) (sum int) {
  for _, num := range numbers {
    if num > 0 {
      sum = sum + num
    }
  }
  return
}
