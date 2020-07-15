#rafael.oliveira
defmodule Kata do
  @spec is_divisible(pos_integer(), pos_integer(), pos_integer()) :: boolean()
  def is_divisible(n, x, y), do: rem(n,x) + rem(n,y) == 0
end
