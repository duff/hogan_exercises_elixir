# Just some assertions to verify Gavin and I are both handling same inputs
defmodule AreaRoom.G.Gavin.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "feet - feet" do
    assert_area ["10f", "10f"], "100.0 square feet\n9.29 square meters"
  end

  test "meters - meters" do
    assert_area ["10m", "10m"], "1076.391 square feet\n100.0 square meters"
  end

  test "feet - meters" do
    assert_area ["123.123f", "555m"], "224190.502 square feet\n20827.979 square meters"
  end

  test "meters - feet" do
    assert_area ["10m", "123f"], "4035.433 square feet\n374.904 square meters"
  end

  defp assert_area(input_strings, expected_result_regex) do
    result = captured(input_strings)
    assert String.match?(result, ~r/#{expected_result_regex}/ms), result
  end

  defp captured(input_strings) do
    input = input_strings |> Enum.join("\n")
    capture_io([input: input, capture_prompt: false], &AreaRoom.G.go/0) |> String.strip
  end

end
