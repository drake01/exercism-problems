defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """

  @prefix "One for "
  @suffix ", one for me."

  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you") when is_bitstring(name) do
    "#{@prefix}#{name}#{@suffix}"
  end
end
