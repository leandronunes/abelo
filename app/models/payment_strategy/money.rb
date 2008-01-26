class Money < PaymentBase

  def is_money?
    true
  end

  def display_class
    MoneyDisplay
  end

end
