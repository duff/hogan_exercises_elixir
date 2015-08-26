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

SelfCheckout.go