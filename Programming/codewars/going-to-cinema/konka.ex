#konka
defmodule Movie do

  def movie(card, ticket, perc) do
    rec(ticket, card, perc, ticket, 1)
  end

  def rec(ticket, sum, perc, curr, cnt) do
    cond do
      Float.ceil(sum + curr * perc) - ticket >= 0 ->
        rec(ticket, sum + curr * perc - ticket, perc, curr * perc, cnt + 1)
      true ->
        cnt
    end
  end

end
