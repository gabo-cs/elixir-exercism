defmodule FreelancerRates do
  @hours_per_day 8.0
  @billable_days_per_month 22

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate = daily_rate(hourly_rate) * @billable_days_per_month
    discounted_monthly_rate = apply_discount(monthly_rate, discount)
    ceil(discounted_monthly_rate)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate = daily_rate(hourly_rate)
    discounted_daily_rate = apply_discount(daily_rate, discount)
    days_in_budget = budget / discounted_daily_rate
    Float.floor(days_in_budget, 1)
  end
end
