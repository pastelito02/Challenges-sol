defmodule Codewars.StringUtils do
  @d ?a - ?A

  def alter_case(str) do
    str
    |> String.to_char_list
    |> Enum.map(&( _alter(&1)) )
    |> List.to_string
  end

  defp _alter(c) when c in ?a..?z, do: c - @d
  defp _alter(c) when c in ?A..?Z, do: c + @d
  defp _alter(c), do: c
end
