class Check < PaymentBase

  def is_check?
    true
  end

  def display_class
    CheckDisplay
  end

end
