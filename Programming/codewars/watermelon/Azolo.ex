#Azolo
defmodule Watermelon do
  def divide(2), do: false
  def divide(x) when rem(x, 2) == 0, do: true
  def divide(_), do: false
end
