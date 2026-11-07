defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name |> String.trim() |> String.first()
  end

  def initial(name) do
    String.upcase(first_letter(name)) <> "."
  end

  def initials(full_name) do
    full_name |> String.split(" ") |> Enum.map(fn x -> initial(x) end) |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    "❤-------------------❤
|  #{initials(full_name1)}  +  #{initials(full_name2)}  |
❤-------------------❤\n"

    # Please implement the pair/2 function
  end
end
