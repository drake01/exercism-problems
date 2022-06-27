defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> to_words()
    |> Enum.frequencies()
  end

  defp to_words(sentence) do
    ~r/[\s_,!&@$%^:.]+/
    |> Regex.split(sentence)
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&normalize_word/1)
  end

  defp normalize_word(word) do
    word |> String.trim_leading("'") |> String.trim_trailing("'")
  end

end
