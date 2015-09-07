defmodule InputRetriever do

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
    parsed = retrieve_string(prompt) |> type.parse
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

  def retrieve_string(prompt) do
    IO.gets(prompt) |> String.strip
  end

  def retrieve_string(prompt, allowed_values) do
    captured = IO.gets(prompt) |> String.strip
    if captured in allowed_values do
      captured
    else
      IO.puts "Invalid entry of #{captured}.  Only #{inspect allowed_values} are allowed.  Try again."
      retrieve_string(prompt, allowed_values)
    end
  end

end
