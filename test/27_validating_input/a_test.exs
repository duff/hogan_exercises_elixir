defmodule ValidatingInput.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &ValidatingInput.A.go/0

  test "first name required" do
    assert_io [" ", "Joe"], ~r/Cannot be blank.*First name: Joe/s
  end

  test "first name must be at least 2 characters" do
    assert_io ["R", "Joe"], ~r/Too short.*First name: Joe/s
  end

end
