defmodule SelfCheckout.B do

  import NumberRetriever

  defp display(name, amount) do
    IO.puts "#{name}: $#{amount |> Float.round(2) |> Float.to_string([decimals: 2])}"
  end

  defp retrieve_price_quantity(which_one) do
    price = retrieve_float("Price of item #{which_one}: ")
    quantity = retrieve_integer("Quantity of item #{which_one}: ")
    { price, quantity }
  end

  def go do
    { price_1, quantity_1 } = retrieve_price_quantity(1)
    { price_2, quantity_2 } = retrieve_price_quantity(2)
    { price_3, quantity_3 } = retrieve_price_quantity(3)

    subtotal = (price_1 * quantity_1) + (price_2 * quantity_2) + (price_3 * quantity_3)
    tax = subtotal * 0.055
    total = subtotal + tax

    IO.puts ""
    display("Subtotal", subtotal)
    display("Tax", tax)
    IO.puts "----------------"
    display("Total", total)
  end

end
