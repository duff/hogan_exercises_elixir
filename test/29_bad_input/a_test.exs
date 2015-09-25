defmodule BadInput.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &BadInput.A.go/0

  test "go" do
    assert_io [ 0, 4 ], ~r/No zeros allowed.*It will take 18.0 years/s
    assert_io [ -3, 0, 4 ], ~r/No negatives.*No zeros allowed.*It will take 18.0 years/s
    assert_io [ "aa", 0, 4 ], ~r/must enter a valid float.*No zeros allowed.*It will take 18.0 years/s
    assert_io [ 8.31 ], ~r/It will take 8.7 years/s
  end

end
