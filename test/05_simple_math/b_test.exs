defmodule SimpleMath.B.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "go" do
    result = captured("5\n6")
    assert String.contains?(result, "5.0 * 6.0 = 30.0")
    assert String.contains?(result, "5.0 + 6.0 = 11.0")
  end

  test "must be a number" do
    result = captured("abc\n3\ng\n2")
    assert String.match?(result, ~r/enter a valid amount.* again.*enter a valid amount.*3.0 - 2.0 = 1.0/ms)
  end

  test "negative numbers" do
    result = captured("8\n-3\n1")
    assert String.match?(result, ~r/No negatives allowed.*8.0 - 1.0 = 7.0/ms)
  end

  defp captured(input) do
    capture_io([input: input, capture_prompt: false], &SimpleMath.B.go/0) |> String.strip
  end

end
