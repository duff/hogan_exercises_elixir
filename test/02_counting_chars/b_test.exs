defmodule CountingChars.B.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &CountingChars.B.go/0

  test "go" do
    assert_io "Homer", "Homer has 5 characters."
    assert_io "This is great", "This is great has 13 characters."
  end

end
