defmodule CountingChars do

  def retrieve_input do
    IO.gets("What is the input string? ") |> String.strip
  end

  def generate_output("") do
    IO.puts "You need to enter some input!"
    go
  end

  def generate_output(input) do
    IO.puts "#{input} has #{input |> String.length} characters."
  end

  def go do
    retrieve_input |> generate_output
  end

end

CountingChars.go
