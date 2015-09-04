defmodule SayingHello.F.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &SayingHello.F.go/0

  test "go" do
    assert_io_result("Someone Else", "Hello, Someone Else, nice to meet you!")
    assert_io_result("Fred", "Fred! How goes it?")
    assert_io_result("Joe", "Yo, Joe, what's up?")
  end

end
