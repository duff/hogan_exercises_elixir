defmodule SayingHello.E.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &SayingHello.E.go/0

  test "go" do
    assert_io("Someone Else", "Hello, Someone Else, nice to meet you!")
    assert_io("Fred", "Fred! How goes it?")
    assert_io("Joe", "Yo, Joe, what's up?")
  end

end
