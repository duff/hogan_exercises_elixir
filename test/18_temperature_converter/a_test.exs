defmodule TemperatureConverter.A.Test do
  use ExUnit.Case, async: true
  use CaptureIOSupport, function: &TemperatureConverter.A.go/0

  test "only allows c's or f's for convert to" do
    assert_io [ "nope", "f", "32" ], ~r/Invalid entry of nope/
  end

  test "go" do
    assert_io [ "c", "32" ], ~r/temperature in Celsius is 0.0 degrees/
    assert_io [ "C", "32.0" ], ~r/temperature in Celsius is 0.0 degrees/
    assert_io [ "c", "82.83" ], ~r/temperature in Celsius is 28.24 degrees/
    assert_io [ "f", "23.1" ], ~r/temperature in Fahrenheit is 73.58 degrees/
    assert_io [ "F", "8" ], ~r/temperature in Fahrenheit is 46.4 degrees/
  end

end
