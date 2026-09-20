defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    [_ | b] = list
    b
  end

  def first(list) do
    [a | _] = list
    a
  end

  def count_aux([], result) do
    result
  end
  def count_aux([_|b], result) do
    count_aux(b, result + 1)
  end

  def count(list) do
    count_aux(list, 0)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
