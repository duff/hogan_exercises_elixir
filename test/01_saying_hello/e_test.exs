defmodule SayingHello.E.Test do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "go" do
    assert_response("Someone Else", "Hello, Someone Else, nice to meet you!")
    assert_response("Fred", "Fred! How goes it?")
    assert_response("Joe", "Yo, Joe, what's up?")
  end

  defp assert_response(input, expected_output) do
    only_captured_output = capture_io([input: input, capture_prompt: false], &SayingHello.E.go/0) |> String.strip
    assert only_captured_output == expected_output
  end

end
