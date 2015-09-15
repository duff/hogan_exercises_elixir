defmodule ComparingNumbers.C.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &ComparingNumbers.C.go/0

  test "ensure no duplicate numbers" do
    assert_io [ 5, 8, 8, 9, 8, 8, 2 ], ~r/That already exists.  Try again.*The largest number is 9/s
  end

  test "go" do
    assert_io [ 5, 8, 3 ], "The largest number is 8"
    assert_io [ 5, 0, 3 ], "The largest number is 5"
  end

end
