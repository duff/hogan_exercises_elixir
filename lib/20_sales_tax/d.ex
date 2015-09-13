defmodule SalesTax.D do

  import InputRetriever
  import Money

  @tax_rates [
    [ "illinois", "il", 0.08 ],
    [ "wisconsin", "wi", 0, %{
                              "eau claire" => 0.005,
                              "dunn" => 0.004 }],
    [ "north carolina", "nc", 0.02, %{
                              "johnston" => 0.007 }]
  ]

  defp rates(state) do
    Enum.find(@tax_rates, [], fn(each) ->
      state in Enum.take(each, 2)
    end)
  end

  defp state_tax_rate(state) do
    rates(state) |> Enum.at(2) || 0
  end

  defp retrieve_county do
    retrieve_string("What county do you live in? ") |> String.downcase
  end

  defp actual_county_rate(nil), do: 0
  defp actual_county_rate(counties), do: counties[retrieve_county] || 0

  defp county_tax_rate(state) do
    rates(state) |> Enum.at(3) |> actual_county_rate
  end

  defp calculate_tax(order_amount, state) do
    (order_amount * state_tax_rate(state)) + (order_amount * county_tax_rate(state))
  end

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
