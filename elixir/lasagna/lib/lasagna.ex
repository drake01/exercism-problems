defmodule Lasagna do

  @expected_minutes 40

  @per_layer_minutes 2

  @alarm_message  "Ding!"

  def expected_minutes_in_oven, do: @expected_minutes

  def remaining_minutes_in_oven(time_spent) do
    expected_minutes_in_oven() - time_spent
  end

  def preparation_time_in_minutes(layer_count), do:  @per_layer_minutes * layer_count

  def total_time_in_minutes(layer_count, time_spent) do
    preparation_time_in_minutes(layer_count) +  time_spent
  end

  def alarm, do: @alarm_message

end
