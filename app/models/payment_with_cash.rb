class PaymentWithCash < Payment

  validates_presence_of :cash
  validates_numericality_of :cash

  # calculates the change needed
  def change
    (cash - value)
  end

end
