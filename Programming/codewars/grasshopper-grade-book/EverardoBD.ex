defmodule GetGrade do
  def get_grade(a, b, c) do
    score((a + b + c) / 3)
  end

  def score(s) when s >= 90, do: "A"
  def score(s) when s >= 80, do: "B"
  def score(s) when s >= 70, do: "C"
  def score(s) when s >= 60, do: "D"
  def score(_), do: "F"
end
