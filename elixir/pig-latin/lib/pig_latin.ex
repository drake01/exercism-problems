defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&normalized/1)
    |> Enum.join(" ")
  end

  defp normalized(["q", "u"| t]), do: t ++ ["quay"]

  defp normalized(["y", x| _] = word) when x not in ~w(a e i o u) do
    word ++ ["ay"]
  end

  defp normalized(["x", y| _] = word) when y not in ~w(a e i o u) do
    word ++ ["ay"]
  end

  defp normalized([h | _] = word) when h in ~w(a e i o u) do
    word ++ ["ay"]
  end

  defp normalized([h | t]) do
    normalized(t ++ [h])
  end

end
