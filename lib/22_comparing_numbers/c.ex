defmodule ComparingNumbers.C do

  import InputRetriever

  defp retrieve_unique_number(existing \\ [], prompt) do
    value = retrieve_integer(prompt)
    if value in existing do
      IO.puts "That already exists.  Try again."
      retrieve_unique_number(existing, prompt)
    else
      [ value | existing ]
    end
  end

  defp retrieve_numbers do
    retrieve_unique_number("Enter the first number: ")
    |> retrieve_unique_number("Enter the second number: ")
    |> retrieve_unique_number("Enter the third number: ")
  end

  def go do
    IO.puts "The largest number is #{retrieve_numbers |> Enum.max}"
  end

end
