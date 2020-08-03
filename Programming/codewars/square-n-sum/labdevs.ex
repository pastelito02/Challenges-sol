defmodule SquareSum do
  def square_sum(nums) do
    nums
    |> Enum.map(&(&1 * &1))
    |> Enum.sum
  end
end
