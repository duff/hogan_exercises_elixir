defmodule AddingNumbers.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &AddingNumbers.A.go/0

  test "ensure only allows numbers" do
    assert_io [ 5, "ab", 45, :eof ], ~r/enter a valid float. Try again.*The total is 50.0/s
  end

  test "go" do
    assert_io [ 5, 22, 3, 4, 1, :eof ], "The total is 35.0"
    assert_io [ 5, 0, 32, 1.93, :eof ], "The total is 38.93"
  end

end
