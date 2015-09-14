defmodule NumbersToNames.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &NumbersToNames.A.go/0

  test "invalid input" do
    assert_io [ "Joe", 9 ], ~r/You must enter a valid integer./ms
    assert_io [ 14, 9 ], ~r/Invalid entry of 14/ms
  end

  test "go" do
    assert_io [ 11 ], ~r/November/ms
    assert_io [ 3 ], ~r/March/ms
  end

end
