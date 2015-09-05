defmodule PasswordValidation.B do

  import InputRetriever
  alias Comeonin.Bcrypt

  @salt "$2b$04$AtcNswT8/nuoGxB9ll5Q.e"

  @credentials %{
    "Fred" => Bcrypt.hashpass("ValidFredPassword", @salt),
    "Joe"  => Bcrypt.hashpass("LegitJoePwd", @salt)
  }

  def go do
    username = retrieve_string("What is the username? ")
    password = retrieve_string("What is the password? ")
    if @credentials[username] && Bcrypt.checkpw(password, @credentials[username]) do
      IO.puts "You may pass"
    else
      IO.puts "I never knew ye"
    end
  end

end
