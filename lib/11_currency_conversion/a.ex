defmodule CurrencyConversion.A do

  import NumberRetriever

  def go do
    euros = retrieve_float("How many euros are you exchanging? ")
    exchange_rate = retrieve_float("What is the exchange rate? ")
    dollars = euros * exchange_rate

    IO.puts """
    #{euros} euros at an exchange rate of #{exchange_rate} is
    #{Float.ceil(dollars, 2)} U.S. dollars.
    """
  end

end

