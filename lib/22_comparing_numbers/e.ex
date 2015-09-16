defmodule ComparingNumbers.E do

  import InputRetriever

  defp retrieve_unique_numbers(existing \\ []) do
    value = retrieve_integer("Enter number: ")
    cond do
      value in existing ->
        IO.puts "That already exists.  Try again."
        retrieve_unique_numbers(existing)
      value == :eof ->
        existing
      true ->
        retrieve_unique_numbers([value | existing])
    end
  end

  def go do
    numbers = retrieve_unique_numbers
    IO.puts ""
    IO.puts "The largest number is #{Enum.max(numbers)}"
  end

end
