defmodule CountingChars.B.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "go" do
    assert_response("Homer", "Homer has 5 characters.")
    assert_response("This is great", "This is great has 13 characters.")
  end

  defp assert_response(input, expected_output) do
    captured = capture_io([input: input, capture_prompt: false], &CountingChars.B.go/0) |> String.strip
    assert captured == expected_output
  end

end
