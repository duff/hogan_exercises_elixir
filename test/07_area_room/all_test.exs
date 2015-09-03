defmodule AreaRoom.All.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "go" do
    Enum.each [ AreaRoom.B, AreaRoom.C, AreaRoom.D, AreaRoom.E, AreaRoom.F, AreaRoom.G ], fn(each) ->
      assert_area each, ["fred", "3m", "2m"], "enter a valid amount.*6.0 square meters"
      assert_area each, ["8f", "-3", "2f"], "No negatives allowed.*16.0 square feet"
      assert_area each, ["8aa", "9", "2f", "3f"], "You must use the proper form"
      assert_area each, ["7f", "2f"], "14.0 square feet\n1.301 square meters"
      assert_area each, ["9m", "4m"], "387.501 square feet\n36.0 square meters"
      assert_area each, ["8f", "3m"], "78.74 square feet\n7.315 square meters"
      assert_area each, ["3m", "8f"], "78.74 square feet\n7.315 square meters"
      assert_area each, ["3.9m", "8.3f"], "106.201 square feet\n9.866 square meters"

      assert_gavin_input(each)
    end
  end

  defp assert_gavin_input(module) do
    assert_area module, ["10f", "10f"], "100.0 square feet\n9.29 square meters"
    assert_area module, ["10m", "10m"], "1076.391 square feet\n100.0 square meters"
    assert_area module, ["123.123f", "555m"], "224190.502 square feet\n20827.979 square meters"
    assert_area module, ["10m", "123f"], "4035.433 square feet\n374.904 square meters"
  end

  defp assert_area(module, input_strings, expected_result_regex) do
    result = captured(module, input_strings)
    assert String.match?(result, ~r/#{expected_result_regex}/ms), "#{module}\n - #{result}"
  end

  defp captured(module, input_strings) do
    input = input_strings |> Enum.join("\n")
    capture_io([input: input, capture_prompt: false], &module.go/0) |> String.strip
  end

end
