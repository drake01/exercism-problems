defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    case "#{factor_3?(number)}#{factor_5?(number)}#{factor_7?(number)}" do
      "" -> "#{number}"
      drop -> drop
    end
  end

  defp factor_3?(number), do: if rem(number, 3)==0, do: "Pling", else: ""
  defp factor_5?(number), do: if rem(number, 5)==0, do: "Plang", else: ""
  defp factor_7?(number), do: if rem(number, 7)==0, do: "Plong", else: ""

end
