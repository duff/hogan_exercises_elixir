defmodule SalesTax.D.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &SalesTax.D.go/0

  test "Illinois" do
    assert_io [ "100", "Illinois" ], ~r/tax is \$8.00.*total is \$108.00/s
    assert_io [ "100", "IlliNoIS" ], ~r/tax is \$8.00.*total is \$108.00/s
    assert_io [ "100", "IL" ], ~r/tax is \$8.00.*total is \$108.00/s
    assert_io [ "100", "iL" ], ~r/tax is \$8.00.*total is \$108.00/s
  end

  test "Wisconsin" do
    assert_io [ "100", "Wisconsin", "Eau Claire" ], ~r/tax is \$0.50.*total is \$100.50/s
    assert_io [ "100", "Wisconsin", "EaU ClAire" ], ~r/tax is \$0.50.*total is \$100.50/s
    assert_io [ "100", "WI", "Eau Claire" ], ~r/tax is \$0.50.*total is \$100.50/s

    assert_io [ "100", "Wisconsin", "Dunn" ], ~r/tax is \$0.40.*total is \$100.40/s
    assert_io [ "100", "Wisconsin", "DUnN" ], ~r/tax is \$0.40.*total is \$100.40/s
    assert_io [ "100", "wI", "Dunn" ], ~r/tax is \$0.40.*total is \$100.40/s

    assert_io [ "100", "Wisconsin", "Some other county" ], "The total is $100.00"
  end

  test "North Carolina" do
    assert_io [ "100", "North Carolina", "Johnston" ], ~r/tax is \$2.70.*total is \$102.70/s
    assert_io [ "100", "North CaroliNa", "JoHnston" ], ~r/tax is \$2.70.*total is \$102.70/s
    assert_io [ "100", "NC", "JoHNSTON" ], ~r/tax is \$2.70.*total is \$102.70/s

    assert_io [ "100", "nC", "Some other county" ], ~r/tax is \$2.00.*total is \$102.00/s
  end

  test "Any other state" do
    assert_io [ "10", "WA" ], "The total is $10.00"
    assert_io [ "12.34", "SomethingElse" ], "The total is $12.34"
  end

end
