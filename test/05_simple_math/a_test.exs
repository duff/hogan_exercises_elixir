defmodule SimpleMath.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &SimpleMath.A.go/0

  test "go" do
    assert_io ["5", "6"], "5.0 * 6.0 = 30.0"
    assert_io ["8", "3"], "8.0 + 3.0 = 11.0"
  end

end
