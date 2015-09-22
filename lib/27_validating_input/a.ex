defmodule ValidatingInput.A do

  import InputRetriever

  def go do
    first_name = retrieve_string("Enter first name: ", required: true, min_length: 2)

    IO.puts """
    First name: #{first_name}
    """
  end

end
