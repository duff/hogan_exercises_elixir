defmodule SayingHello.D.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "go" do
    assert_response("Someone Else", "Hello, Someone Else, nice to meet you!")
    assert_response("Fred", "Fred! How goes it?")
    assert_response("Joe", "Yo, Joe, what's up?")
  end

  defp assert_response(input, expected_output) do
    captured = capture_io([input: input, capture_prompt: false], &SayingHello.D.go/0) |> String.strip
    assert captured == expected_output
  end

end
