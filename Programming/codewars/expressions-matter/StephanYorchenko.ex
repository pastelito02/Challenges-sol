defmodule ExpressionMatter do
  def expression_matter(a, b, c) do
    q = a + b + c
    w = a + b * c
    e = a * b + c
    r = a * b * c
    t = a * (b + c)
    y = (a + b) * c
    Enum.max([q, w, e, r, t, y])
  end
end
