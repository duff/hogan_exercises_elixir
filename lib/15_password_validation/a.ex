defmodule PasswordValidation.A do

  import InputRetriever

  @credentials %{
    "Fred" => "ValidFredPassword",
    "Joe" => "LegitJoePwd"
  }

  def go do
    username = retrieve_string("What is the username? ")
    password = retrieve_string("What is the password? ")
    case @credentials[username] == password do
      true -> IO.puts "You may pass"
      false -> IO.puts "I never knew ye"
    end
  end

end
