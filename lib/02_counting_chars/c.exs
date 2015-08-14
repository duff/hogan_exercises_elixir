defmodule CountingChars do

  defp retrieve_input do
    IO.gets("What is the input string? ") |> String.strip
  end

  defp generate_output("") do
    IO.puts "You need to enter some input!"
    go
  end

  defp generate_output(input) do
    IO.puts "#{input} has #{input |> String.length} characters."
  end

  def go do
    retrieve_input |> generate_output
  end

end

CountingChars.go
