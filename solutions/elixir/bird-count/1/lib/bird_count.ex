defmodule BirdCount do
  def today([]) do
    nil
  end
  def today([a|_]) do
    a
  end

  def increment_day_count([]) do
    [1]
  end
  def increment_day_count([a|b]) do
    [a+1|b]
  end

  def has_day_without_birds?([]) do
    false
  end
  def has_day_without_birds?([a|b]) do
    if a == 0 do
      true
    else
      has_day_without_birds?(b)
    end
  end

  def total(list) do
    Enum.reduce(list, 0, fn a, acc -> a + acc end)
  end

  def busy_days(list) do
    Enum.count(Enum.filter(list, fn x -> x >= 5 end))
  end
end
