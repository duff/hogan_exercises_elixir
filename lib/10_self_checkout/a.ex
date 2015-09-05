defmodule SelfCheckout.A do

  import InputRetriever

  def go do
    price_1 = retrieve_float("Price of item 1: ")
    quantity_1 = retrieve_integer("Quantity of item 1: ")
    price_2 = retrieve_float("Price of item 2: ")
    quantity_2 = retrieve_integer("Quantity of item 2: ")
    price_3 = retrieve_float("Price of item 3: ")
    quantity_3 = retrieve_integer("Quantity of item 3: ")

    subtotal = (price_1 * quantity_1) + (price_2 * quantity_2) + (price_3 * quantity_3)
    tax = subtotal * 0.055
    total = subtotal + tax

    IO.puts "Subtotal: $#{subtotal |> Float.round(2) |> Float.to_string([decimals: 2])}"
    IO.puts "Tax: $#{tax |> Float.round(2) |> Float.to_string([decimals: 2])}"
    IO.puts "Total: $#{total |> Float.round(2) |> Float.to_string([decimals: 2])}"
  end

end
