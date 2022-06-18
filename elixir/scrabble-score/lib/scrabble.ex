defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> to_charlist()
    |> Enum.map(&score_letter/1)
    |> Enum.sum()
  end

  defp score_letter(letter) when letter in 'AEIOULNRST', do: 1

  defp score_letter(letter) when letter in 'DG', do: 2

  defp score_letter(letter) when letter in 'BCMP', do: 3

  defp score_letter(letter) when letter in 'FHVWY', do: 4

  defp score_letter(letter) when letter in 'K', do: 5

  defp score_letter(letter) when letter in 'JX', do: 8

  defp score_letter(letter) when letter in 'QZ', do: 10

  defp score_letter(_), do: 0

end
