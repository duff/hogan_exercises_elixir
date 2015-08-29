defmodule SimpleMath.A.Test do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "go" do
    result = captured("5\n6")
    assert String.contains?(result, "5.0 * 6.0 = 30.0")
    assert String.contains?(result, "5.0 + 6.0 = 11.0")
  end

  defp captured(input) do
    capture_io([input: input, capture_prompt: false], &SimpleMath.A.go/0) |> String.strip
  end

end
