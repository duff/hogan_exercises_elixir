defmodule SalesTax.A do

  import InputRetriever
  import Money

  defp wisconsin_tax(order_amount) do
    county = retrieve_string("What county do you live in? ")
    cond do
      String.match?(county, ~r/Eau Claire/i) -> order_amount * 0.005
      String.match?(county, ~r/Dunn/i) -> order_amount * 0.004
      true -> 0
    end
  end

  defp calculate_tax(order_amount, state) do
    cond do
      String.match?(state, ~r/illinois|il/i) -> order_amount * 0.08
      String.match?(state, ~r/wisconsin|wi/i) -> wisconsin_tax(order_amount)
      true -> 0
    end
  end

  def go do
    order_amount = retrieve_float("What is the order amount? ")
    state = retrieve_string("What state do you live in? ")
    tax = calculate_tax(order_amount, state)
    total = order_amount + tax

    if tax != 0, do: IO.puts "The tax is #{tax |> as_money}."
    IO.puts "The total is #{total |> as_money}"
  end

end
