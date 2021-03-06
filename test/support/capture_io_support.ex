defmodule CaptureIOSupport do
  import ExUnit.Assertions
  import ExUnit.CaptureIO

  defmacro __using__(opts) do
    function = Keyword.get(opts, :function)
    quote do
      import CaptureIOSupport
      @function_to_call unquote(function)
    end
  end

  defmacro assert_io(input, expected_result_regex) do
    quote do
      assert_io(@function_to_call, unquote(input), unquote(expected_result_regex))
    end
  end

  def assert_io(function, input, expected_result) when is_binary(expected_result) do
    result = captured(function, input)
    assert String.contains?(result, expected_result), result_deets(expected_result, result)
  end

  def assert_io(function, input, expected_result) do
    result = captured(function, input)
    assert String.match?(result, expected_result), result_deets(expected_result, result)
  end

  defp captured(function, input_strings) when is_list(input_strings) do
    input = input_strings |> Enum.join("\n")
    captured(function, input)
  end

  defp captured(function, input) do
    capture_io([input: input, capture_prompt: false], function) |> String.strip
  end

  defp result_deets(expected, actual) do
    "Expected capture:   #{inspect expected}\nUnexpected capture: #{inspect actual}"
  end

end
