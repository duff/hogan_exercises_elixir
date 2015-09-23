defmodule ValidatingInput.A do

  import InputRetriever

  def go do
    first_name = retrieve_string("Enter first name: ", required: true, min_length: 2)
    last_name = retrieve_string("Enter last name: ", required: true, min_length: 2)
    zip_code = retrieve_integer("Enter zip code: ")
    employee_id = retrieve_string("Enter employee ID: ", format: ~r/^[a-zA-Z]{2}-\d{4}$/)

    IO.puts """
    First name: #{first_name}
    Last name: #{last_name}
    Zip Code: #{zip_code}
    Employee ID: #{employee_id}
    """
  end

end
