defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    num_digits = length(digits)
    digits_sum = for d <- digits, reduce: 0 do
      sum -> sum+:math.pow(d, num_digits)
    end
    number == digits_sum
  end

end
