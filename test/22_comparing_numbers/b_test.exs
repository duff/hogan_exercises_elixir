defmodule ComparingNumbers.B.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &ComparingNumbers.B.go/0

  test "ensure no duplicate numbers" do
    assert_io [ 5, 8, 8 ], "All numbers must be unique"
  end

  test "go" do
    assert_io [ 5, 8, 3 ], "The largest number is 8"
    assert_io [ 5, 0, 3 ], "The largest number is 5"
  end

end
