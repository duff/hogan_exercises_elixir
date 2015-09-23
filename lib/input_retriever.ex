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
      :eof           -> { :ok, :eof }
      :error         -> error_tuple(type)
    end
  end

  defp parse(retrieved, type) do
    case retrieved do
      :eof -> :eof
      value -> type.parse(value)
    end
  end

  defp retrieve(prompt, type) do
    parsed = retrieve_string(prompt) |> parse(type)
    case process_number(parsed, type) do
      { :ok, amount } -> amount
      { :error, message } ->
        IO.puts(message)
        retrieve(prompt, type)
    end
  end

  defp validate_allowed(value, nil, _), do: value
  defp validate_allowed(value, allowed_values, fun) do
    if value in allowed_values do
      value
    else
      IO.puts "Invalid entry of #{value}.  Only #{inspect allowed_values} are allowed.  Try again."
      fun.()
    end
  end

  defp validate_min_length(value, nil, _), do: value
  defp validate_min_length(value, length, fun) do
    if String.length(value) >= length do
      value
    else
      IO.puts "Too short.  Try again."
      fun.()
    end
  end

  defp validate_format(value, nil, _), do: value
  defp validate_format(value, format, fun) do
    if Regex.match?(format, value) do
      value
    else
      IO.puts "Invalid format.  Try again."
      fun.()
    end
  end

  defp validate_required(value, false, _), do: value
  defp validate_required(value, true, fun) do
    if String.length(value) > 0 do
      value
    else
      IO.puts "Cannot be blank.  Try again."
      fun.()
    end
  end

  def retrieve_float(prompt), do: retrieve(prompt, Float)
  def retrieve_integer(prompt), do: retrieve(prompt, Integer)

  def retrieve_integer(prompt, opts = [in: allowed_values]) do
    retrieve(prompt, Integer)
    |> validate_allowed(allowed_values, fn -> retrieve_integer(prompt, opts) end)
  end

  def retrieve_string(prompt) do
    case IO.gets(prompt) do
      :eof -> :eof
      value -> String.strip(value)
    end
  end

  def retrieve_string(prompt, opts) do
    value = retrieve_string(prompt)
    allowed_values = Keyword.get(opts, :in)
    required = Keyword.has_key?(opts, :required)
    min_length = Keyword.get(opts, :min_length)
    format = Keyword.get(opts, :format)
    fun = fn -> retrieve_string(prompt, opts) end

    value
    |> validate_required(required, fun)
    |> validate_allowed(allowed_values, fun)
    |> validate_min_length(min_length, fun)
    |> validate_format(format, fun)
  end

end
