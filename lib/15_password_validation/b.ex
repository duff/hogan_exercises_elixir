defmodule PasswordValidation.B do

  alias Comeonin.Bcrypt

  @salt "$2b$04$AtcNswT8/nuoGxB9ll5Q.e"

  @credentials %{
    "Fred" => Bcrypt.hashpass("ValidFredPassword", @salt),
    "Joe"  => Bcrypt.hashpass("LegitJoePwd", @salt)
  }

  defp retrieve_string(prompt) do
    IO.gets(prompt) |> String.strip
  end

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
