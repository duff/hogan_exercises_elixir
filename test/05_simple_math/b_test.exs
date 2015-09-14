defmodule SimpleMath.B.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &SimpleMath.B.go/0

  test "go" do
    assert_io ["5", "6"], "5.0 * 6.0 = 30.0"
    assert_io ["8", "3"], "8.0 + 3.0 = 11.0"
  end

  test "must be a number" do
    assert_io ["abc", "3", "ng", "2"], ~r/enter a valid amount.* again.*enter a valid amount.*3.0 - 2.0 = 1.0/ms
  end

  test "negative numbers" do
    assert_io ["8", "-3", "1"], ~r/No negatives allowed.*8.0 - 1.0 = 7.0/ms
  end

end
