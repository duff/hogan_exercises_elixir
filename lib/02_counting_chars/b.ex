defmodule CountingChars.B do

  defp retrieve_input do
    IO.gets("What is the input string? ") |> String.strip
  end

  def go do
    case input = retrieve_input do
      "" -> IO.puts "You need to enter some input!"; go
      _  -> IO.puts "#{input} has #{input |> String.length} characters."
    end
  end

end
