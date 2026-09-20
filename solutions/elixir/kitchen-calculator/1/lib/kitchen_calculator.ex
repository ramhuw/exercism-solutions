defmodule KitchenCalculator do
  def get_volume({_, b}) do
    b
  end

  def to_milliliter({:cup, f}) do
    {:milliliter, f * 240}
  end
  def to_milliliter({:fluid_ounce, f}) do
    {:milliliter, f * 30}
  end
  def to_milliliter({:teaspoon, f}) do
    {:milliliter, f * 5}
  end
  def to_milliliter({:tablespoon, f}) do
    {:milliliter, f * 15}
  end
  def to_milliliter({:milliliter, f}) do
    {:milliliter, f}
  end

  def from_milliliter({:milliliter, f}, :milliliter) do
    {:milliliter, f}
  end
  def from_milliliter({:milliliter, f}, :cup) do
    {:cup, f / 240}
  end
  def from_milliliter({:milliliter, f}, :fluid_ounce) do
    {:fluid_ounce, f / 30}
  end
  def from_milliliter({:milliliter, f}, :teaspoon) do
    {:teaspoon, f / 5}
  end
  def from_milliliter({:milliliter, f}, :tablespoon) do
    {:tablespoon, f / 15}
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) |> from_milliliter(unit)
  end
end
