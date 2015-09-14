defmodule ComparingNumbers.A do

  import InputRetriever

  defp do_max([head | tail], nil), do: do_max(tail, head)
  defp do_max([head | tail], max) when head > max, do: do_max(tail, head)
  defp do_max([_ | tail], max), do: do_max(tail, max)
  defp do_max(_, max), do: max

  defp max(list) do
    do_max(list, nil)
  end

  defp retrieve_numbers do
    [
      retrieve_integer("Enter the first number: "),
      retrieve_integer("Enter the second number: "),
      retrieve_integer("Enter the third number: ")
    ]
  end

  defp unique_count(list), do: Enum.uniq(list) |> Enum.count

  defp any_non_unique?(list) do
    unique_count(list) < Enum.count(list)
  end

  def go do
    numbers = retrieve_numbers
    if any_non_unique?(numbers) do
      IO.puts "All numbers must be unique"
    else
      IO.puts "The largest number is #{max(numbers)}"
    end
  end

end
