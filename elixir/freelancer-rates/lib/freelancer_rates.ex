defmodule FreelancerRates do
  @hours_per_day 8.0
  @billable_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    net_bill = before_discount * discount / 100
    before_discount - net_bill
  end

  def monthly_rate(hourly_rate, discount) do
    daily_net = hourly_rate |> daily_rate |> apply_discount(discount)
    daily_net * @billable_days |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_net = hourly_rate |> daily_rate |> apply_discount(discount)
    (budget / daily_net) |> Float.floor(1)
  end
end
