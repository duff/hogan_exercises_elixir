defmodule CurrencyConversion.B do

  import NumberRetriever

  def exchange_rate_from_api do
    url = "https://openexchangerates.org/api/latest.json?app_id=12812062b1be42e3ba3fc3de29d0651b"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        parsed = body |> Poison.decode!
        parsed["rates"]["EUR"]
      {:error, _} ->
        IO.puts "Unable to connect to the exchange rate server.  Using 1.3751 as the exchange rate."
        1.3751
    end
  end

  def go do
    euros = retrieve_float("How many euros are you exchanging? ")
    exchange_rate = exchange_rate_from_api
    dollars = euros * exchange_rate

    IO.puts """
    #{euros} euros at an exchange rate of #{exchange_rate} is
    #{Float.ceil(dollars, 2)} U.S. dollars.
    """
  end

end
