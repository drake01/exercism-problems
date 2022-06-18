defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |>  to_charlist()
    |> Enum.reduce_while([], fn
        b, acc when b in '{([' -> {:cont, [b |acc]}
        ?], [?[ | acc] -> {:cont, acc}
        ?), [?( | acc] -> {:cont, acc}
        ?}, [?{ | acc] -> {:cont, acc}
        b, _ when b in '])}' -> {:halt, nil}
        _, acc -> {:cont, acc}
    end) == []
  end
end
