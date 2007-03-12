class PaymentWithCash < Payment

  validates_presence_of :cash
  validates_numericality_of :cash

  # calculates the change needed
  def change
    (cash > value) ? (cash - value) : 0.0
  end

end
