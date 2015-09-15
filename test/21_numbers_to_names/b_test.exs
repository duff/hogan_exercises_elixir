defmodule NumbersToNames.B.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &NumbersToNames.B.go/0

  test "invalid input" do
    assert_io [ "en", "Joe", 9 ], ~r/You must enter a valid integer./s
    assert_io [ "en", 14, 9 ], ~r/Invalid entry of 14/s
    assert_io [ "Huh", "en", 9 ], ~r/Invalid entry of Huh/s
  end

  test "en" do
    assert_io [ "en", 11 ], ~r/November/s
    assert_io [ "en", 3 ], ~r/March/s
  end

  test "da" do
    assert_io [ "da", 5 ], ~r/Maj/s
    assert_io [ "da", 10 ], ~r/Oktober/s
  end

  test "es" do
    assert_io [ "es", 9 ], ~r/septiembre/s
    assert_io [ "es", 2 ], ~r/febrero/s
  end

end
