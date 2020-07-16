#Samboozle
defmodule Kata do
  def subtract_sum(n) when n > 100 do
    sum =
      n |> Integer.digits |> Enum.sum
    subtract_sum(n - sum)
  end
  def subtract_sum(_), do: "apple"
end
