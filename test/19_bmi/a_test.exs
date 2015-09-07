defmodule BMI.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &BMI.A.go/0

  test "go" do
    assert_io_result [ "70", "150" ], ~r/BMI is 21.5..*within the ideal/ms
    assert_io_result [ "90", "140" ], ~r/BMI is 12.2..*underweight/ms
    assert_io_result [ "60", "250" ], ~r/BMI is 48.8..*overweight/ms
  end

end
