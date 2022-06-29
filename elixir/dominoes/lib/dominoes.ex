defmodule Dominoes do
  @type domino :: {1..6, 1..6}

  @doc """
  chain?/1 takes a list of domino stones and returns boolean indicating if it's
  possible to make a full chain
  """
  @spec chain?(dominoes :: [domino]) :: boolean
  def chain?([]), do: true

  def chain?([h | rest]) do
    do_chain?(rest, h)
  end

  defp do_chain?([], {a, a}), do: true

  defp do_chain?([], _), do: false

  defp do_chain?(dominoes, {f, b}) do
    Stream.map(dominoes, fn
      {a, ^b} = one -> do_chain?(List.delete(dominoes, one), {f, a})
      {^b, a} = one -> do_chain?(List.delete(dominoes, one), {f, a})
      _ -> false
    end)
    |> Enum.any?(&Function.identity/1)
  end

end
