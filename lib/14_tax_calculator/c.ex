defmodule TaxCalculator.C do

  import InputRetriever
  import Money

  defp output(state, order_amount) when state in ["wi", "wisconsin"] do
    tax = order_amount * 0.055
    IO.puts """
    The subtotal is #{order_amount |> as_money}.
    The tax is #{tax |> as_money}.
    The total is #{(order_amount + tax) |> as_money}.
    """
  end

  defp output(_, order_amount) do
    IO.puts "The total is #{order_amount |> as_money}."
  end

  def go do
    order_amount = retrieve_float("What is the order amount? ")
    state = retrieve_string("What is the state? ") |> String.downcase
    output(state, order_amount)
  end

end
