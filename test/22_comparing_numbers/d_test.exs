defmodule ComparingNumbers.D.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &ComparingNumbers.D.go/0

  test "ensure no duplicate numbers" do
    assert_io [ 5, 0, 3, 3229, 12, 2, 3, 34, 82, 21, 3, 9 ], ~r/That already exists.  Try again.*The largest number is 3229/s
  end

  test "go" do
    assert_io [ 5, 8, 3, 4, 9, 22, 1, 23, 21, 0 ], "The largest number is 23"
    assert_io [ 5, 0, 3, 322, 12, 2, 34, 82, 21, 9 ], "The largest number is 322"
  end

end
