module MembershipsHelper

  # Method used to translate true/false from db - fee_paid and tshirt.
  def format_true_false statement
    if statement == true
      "Tak"
    else
      "Nie"
    end
  end

  DOW = {
    1 => "poniedziałek",
    2 => "wtorek",
    3 => "środa",
    4 => "czwartek",
    5 => "piątek",
    6 => "sobota",
    7 => "niedziela"
  }
  def format_dow num
    DOW[num.to_i]
  end
end
