defmodule PasswordValidation.A do

  @credentials %{
    "Fred" => "ValidFredPassword",
    "Joe" => "LegitJoePwd"
  }

  defp retrieve_string(prompt) do
    IO.gets(prompt) |> String.strip
  end

  def go do
    username = retrieve_string("What is the username? ")
    password = retrieve_string("What is the password? ")
    case @credentials[username] == password do
      true -> IO.puts "You may pass"
      false -> IO.puts "I never knew ye"
    end
  end

end
