defmodule SayingHello do

  def retrieve_name do
    IO.gets("What is your name? ") |> String.strip
  end

  def response("Joe"), do: "Yo, Joe, what's up?"
  def response("Fred"), do: "Fred! How goes it?"
  def response(name), do: "Hello, #{name}, nice to meet you!"

  def go do
    retrieve_name |> response |> IO.puts
  end
end

SayingHello.go
