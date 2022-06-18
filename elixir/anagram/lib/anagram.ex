defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    with str <- normalized_str(base) do
      candidates |> Enum.filter(&anagram?(normalized_str(&1), str))
    end
  end

  def normalized_str(str) do
    str |> String.downcase() |> to_charlist()
  end

  def anagram?(s1, s1 ), do: false
  def anagram?(s1, s2 ), do: Enum.sort(s1) == Enum.sort(s2)

end
