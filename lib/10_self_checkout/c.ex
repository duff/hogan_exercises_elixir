defmodule SelfCheckout.C do

  import NumberRetriever

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
