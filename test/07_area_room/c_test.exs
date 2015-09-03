defmodule AreaRoom.C.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "must be a number" do
    assert_area ["fred", "3m", "2m"], "enter a valid amount.*6.0 square meters"
  end

  test "negative numbers" do
    assert_area ["8f", "-3", "2f"], "No negatives allowed.*16.0 square feet"
  end

  test "invalid format" do
    assert_area ["8aa", "9", "2f", "3f"], "You must use the proper form"
  end

  test "feet - feet" do
    assert_area ["7f", "2f"], "14.0 square feet\n1.301 square meters"
  end

  test "meters - meters" do
    assert_area ["9m", "4m"], "387.501 square feet\n36.0 square meters"
  end

  test "feet - meters" do
    assert_area ["8f", "3m"], "78.74 square feet\n7.315 square meters"
  end

  test "meters - feet" do
    assert_area ["3m", "8f"], "78.74 square feet\n7.315 square meters"
  end

  defp assert_area(input_strings, expected_result_regex) do
    result = captured(input_strings)
    assert String.match?(result, ~r/#{expected_result_regex}/ms), result
  end

  defp captured(input_strings) do
    input = input_strings |> Enum.join("\n")
    capture_io([input: input, capture_prompt: false], &AreaRoom.C.go/0) |> String.strip
  end

end
