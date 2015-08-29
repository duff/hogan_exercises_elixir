defmodule SayingHello.E do

  defp retrieve_name do
    IO.gets("What is your name? ") |> String.strip
  end

  defp response("Joe"), do: "Yo, Joe, what's up?"
  defp response("Fred"), do: "Fred! How goes it?"
  defp response(name), do: "Hello, #{name}, nice to meet you!"

  def go do
    retrieve_name |> response |> IO.puts
  end
end
