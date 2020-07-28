#Evmorov
defmodule Solution do
  def positive_sum(list) do
    list
    |> Stream.filter(&(&1 > 0))
    |> Enum.sum
  end
end
