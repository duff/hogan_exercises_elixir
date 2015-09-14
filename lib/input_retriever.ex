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

  defp confirm_allowed(captured, allowed_values, fun) do
    if captured in allowed_values do
      captured
    else
      IO.puts "Invalid entry of #{captured}.  Only #{inspect allowed_values} are allowed.  Try again."
      fun.()
    end
  end

  def retrieve_float(prompt), do: retrieve(prompt, Float)
  def retrieve_integer(prompt), do: retrieve(prompt, Integer)

  def retrieve_integer(prompt, allowed_values) do
    retrieve(prompt, Integer)
    |> confirm_allowed(allowed_values, fn -> retrieve_integer(prompt, allowed_values) end)
  end

  def retrieve_string(prompt), do: IO.gets(prompt) |> String.strip

  def retrieve_string(prompt, allowed_values) do
    retrieve_string(prompt)
    |> confirm_allowed(allowed_values, fn -> retrieve_string(prompt, allowed_values) end)
  end

end
