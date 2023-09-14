defmodule KitchenCalculator do
  @milliliters_per_cup 240
  @milliliters_per_fl_oz 30
  @milliliters_per_teaspoon 5
  @milliliters_per_tablespoon 15

  def get_volume({_unit, volume}), do: volume

  def to_milliliter(input_already_in_milliliter = {:milliliter, _}), do: input_already_in_milliliter
  def to_milliliter({:cup, cups}), do: {:milliliter, cups * @milliliters_per_cup}
  def to_milliliter({:fluid_ounce, fluid_ounces}), do: {:milliliter, fluid_ounces * @milliliters_per_fl_oz}
  def to_milliliter({:teaspoon, teaspoons}), do: {:milliliter, teaspoons * @milliliters_per_teaspoon}
  def to_milliliter({:tablespoon, tablespoons}), do: {:milliliter, tablespoons * @milliliters_per_tablespoon}

  def from_milliliter(input_already_in_milliliter = {:milliliter, _}, :milliliter), do: input_already_in_milliliter
  def from_milliliter({:milliliter, milliliters}, :cup), do: {:cup, milliliters / @milliliters_per_cup}
  def from_milliliter({:milliliter, milliliters}, :fluid_ounce), do: {:fluid_ounce, milliliters / @milliliters_per_fl_oz}
  def from_milliliter({:milliliter, milliliters}, :teaspoon), do: {:teaspoon, milliliters / @milliliters_per_teaspoon}
  def from_milliliter({:milliliter, milliliters}, :tablespoon), do: {:tablespoon, milliliters / @milliliters_per_tablespoon}

  def convert(input_already_in_target_unit = {unit, _}, unit), do: input_already_in_target_unit
  def convert(volume_pair, unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)
end
