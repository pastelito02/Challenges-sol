/*jealous*/
object SumOfPositive {
  def positiveSum(arr: Array[Int]): Int = {
    arr.filter(x => x > 0).sum
  }
}
