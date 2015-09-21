defmodule CreditCardPayoff.A do

  import InputRetriever

  defp months(balance, apr, monthly_payment) do
    daily_rate = apr / 100 / 365
    left = (balance / monthly_payment)
    right = (1 - (:math.pow((1 + daily_rate), 30)))

    numerator = :math.log(1 + (left * right))
    denominator = :math.log(1 + daily_rate)

    fraction = numerator / denominator
    (-1 / 30) * fraction
  end

  defp formatted(months) do
    months |> Float.ceil |> Kernel.trunc
  end

  def go do
    balance = retrieve_float("What is your balance? ")
    apr = retrieve_float("What is the APR on the card (as a percent)? ")
    monthly_payment = retrieve_float("What is the monthly payment you can make? ")
    months_needed = months(balance, apr, monthly_payment)

    IO.puts "It will take you #{months_needed |> formatted } months to pay off this card."
  end

end
