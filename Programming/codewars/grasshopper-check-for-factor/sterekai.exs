#sterekai
defmodule CheckForFactor do
  def check_for_factor(base, factor), do: rem(base, factor) == 0
end
