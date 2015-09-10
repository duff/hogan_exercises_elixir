defmodule SalesTax.B do

  import InputRetriever
  import Money

  defp calculate_tax(order_amount, state) when state in ~w(illinois il) do
    order_amount * 0.08
  end

  defp calculate_tax(order_amount, state) when state in ~w(wisconsin wi) do
    retrieve_string("What county do you live in? ")
    |> String.downcase
    |> calculate_wi_tax(order_amount)
  end

  defp calculate_tax(_, _), do: 0

  defp calculate_wi_tax("eau claire", order_amount), do: order_amount * 0.005
  defp calculate_wi_tax("dunn", order_amount), do: order_amount * 0.004
  defp calculate_wi_tax(_, _), do: 0

  defp tax_message(0), do: ""
  defp tax_message(tax), do: "The tax is #{tax |> as_money}."

  def go do
    order_amount = retrieve_float("What is the order amount? ")
    state = retrieve_string("What state do you live in? ") |> String.downcase
    tax = calculate_tax(order_amount, state)
    total = order_amount + tax

    IO.puts """
    #{tax_message(tax)}
    The total is #{total |> as_money}
    """
  end

end
