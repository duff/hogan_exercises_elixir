defmodule SayingHello.F do

  defp retrieve_name do
    IO.gets("What is your name? ") |> String.strip
  end

  defp response(name) do
    case name do
      "Joe"  -> "Yo, #{name}, what's up?"
      "Fred" -> "#{name}! How goes it?"
      _      -> "Hello, #{name}, nice to meet you!"
    end
  end

  def go do
    retrieve_name |> response |> IO.puts
  end
end

