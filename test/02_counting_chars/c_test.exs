defmodule CountingChars.C.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &CountingChars.C.go/0

  test "go" do
    assert_io_result "Homer", "Homer has 5 characters."
    assert_io_result "This is great", "This is great has 13 characters."
  end

end
