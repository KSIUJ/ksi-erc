module MembershipsHelper

  # Method used to translate true/false from db - fee_paid and tshirt.
  def format_true_false statement
    if statement == true
      "Tak"
    else
      "Nie"
    end
  end
end
