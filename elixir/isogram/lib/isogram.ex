defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    chars = sentence
    |> String.downcase()
    |> String.replace(~r/[^a-z]/, "")
    |> String.to_charlist()
    chars == Enum.uniq(chars)
  end

end
