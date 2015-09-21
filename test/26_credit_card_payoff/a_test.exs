defmodule CreditCardPayoff.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &CreditCardPayoff.A.go/0

  test "go" do
    assert_io [5000, 12, 100 ], "It will take you 70 months to pay off this card."
    assert_io [5000, 12, 200 ], "It will take you 29 months to pay off this card."
    assert_io [10000, 12, 200 ], "It will take you 70 months to pay off this card."
    assert_io [10000, 3, 200 ], "It will take you 54 months to pay off this card."
  end

end
