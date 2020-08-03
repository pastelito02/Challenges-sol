package kata

func SquareSum(nums []int) (res int) {
    for _, val := range nums {
      res += val * val
    }
    return res
}
