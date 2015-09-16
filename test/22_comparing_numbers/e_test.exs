defmodule ComparingNumbers.E.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &ComparingNumbers.E.go/0

  test "ensure only allows ints" do
    assert_io [ 5, "ab", 45, 3, :eof ], ~r/enter a valid integer. Try again.*The largest number is 45/s
    assert_io [ 5, 12.3, 48, 3, :eof ], ~r/enter a valid integer. Try again.*The largest number is 48/s
  end

  test "ensure no duplicate numbers" do
    assert_io [ 5, 0, 3, 3229, 3, 12, :eof ], ~r/That already exists.  Try again.*The largest number is 3229/s
  end

  test "go" do
    assert_io [ 5, 22, 3, 4, 1, :eof ], "The largest number is 22"
    assert_io [ 5, 0, 32, 1, :eof ], "The largest number is 32"
  end

end
