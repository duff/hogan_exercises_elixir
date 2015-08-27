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

defmodule CurrencyConversion do

  import Retriever

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

CurrencyConversion.go
