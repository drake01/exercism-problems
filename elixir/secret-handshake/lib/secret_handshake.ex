defmodule SecretHandshake do

  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> helper(0x08 == (code &&& 0x08), "jump")
    |> helper(0x04 == (code &&& 0x04), "close your eyes")
    |> helper(0x02 == (code &&& 0x02), "double blink")
    |> helper(0x01 == (code &&& 0x01), "wink")
    |> helper(0x10 == (code &&& 0x10), &Enum.reverse/1)
  end

  defp helper(acc, do?, todo)
  defp helper(acc, false, _), do: acc
  defp helper(acc, true, str) when is_binary(str), do: [str | acc]
  defp helper(acc, true, fun), do: fun.(acc)

end
