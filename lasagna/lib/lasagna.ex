defmodule Lasagna do
  @minutes_in_oven 40
  @layer_preparation_time 2

  def expected_minutes_in_oven(),
    do: @minutes_in_oven

  def remaining_minutes_in_oven(actual_minutes_in_oven) do
    expected_minutes_in_oven() - actual_minutes_in_oven
  end

  def preparation_time_in_minutes(layers) do
    layers * @layer_preparation_time
  end

  def total_time_in_minutes(layers, actual_minutes_in_oven) do
    preparation_time_in_minutes(layers) + actual_minutes_in_oven
  end

  def alarm(), do: "Ding!"
end
