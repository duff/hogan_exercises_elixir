defmodule Retriever do

  defp error_tuple(type) do
    type_str = type |> to_string |> String.replace(~r/Elixir\./, "") |> String.downcase
    { :error, "You must enter a valid #{type_str}. Try again." }
  end

  defp process_number(parsed, type) do
    case parsed do
      { amount, _ } when amount < 0 -> { :error, "No negatives allowed!.  Try again." }
      { amount, "" } -> { :ok, amount }
      { _, _ }       -> error_tuple(type)
      :error         -> error_tuple(type)
    end
  end

  defp retrieve(prompt, type) do
    parsed = IO.gets(prompt) |> String.strip |> type.parse
    case process_number(parsed, type) do
      { :ok, amount } -> amount
      { :error, message } ->
        IO.puts(message)
        retrieve(prompt, type)
    end
  end

  def retrieve_float(prompt) do
    retrieve(prompt, Float)
  end

  def retrieve_integer(prompt) do
    retrieve(prompt, Integer)
  end
end

defmodule SelfCheckout do

  import Retriever

  defp display(name, amount) do
    IO.puts "#{name}: $#{amount |> Float.round(2) |> Float.to_string([decimals: 2])}"
  end

  defp retrieve_price_quantity do
    price = retrieve_float("Price of item: ")
    quantity = retrieve_integer("Quantity of item: ")
    { price, quantity }
  end

  defp retrieve_line_items(acc \\ []) do
    case retrieve_price_quantity do
      {0.0, 0} -> acc |> Enum.reverse
      line_item -> retrieve_line_items([line_item | acc ])
    end
  end

  def go do
    subtotal = Enum.reduce(retrieve_line_items, 0, fn({price, quantity}, acc) ->
      acc + (price * quantity)
    end)

    tax = subtotal * 0.055
    total = subtotal + tax

    IO.puts ""
    display("Subtotal", subtotal)
    display("Tax", tax)
    IO.puts "----------------"
    display("Total", total)
  end

end

SelfCheckout.go
