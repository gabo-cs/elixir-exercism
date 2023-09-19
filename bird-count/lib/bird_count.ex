defmodule BirdCount do
  def today([]), do: nil
  def today([today | _]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | prev_days]), do: [today + 1 | prev_days]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | prev_days]), do: has_day_without_birds?(prev_days)

  def total([]), do: 0
  def total([today | prev_days]), do: today + total(prev_days)

  def busy_days([]), do: 0
  def busy_days([today | prev_days]) when today >= 5, do: 1 + busy_days(prev_days)
  def busy_days([_ | prev_days]), do: busy_days(prev_days)
end
