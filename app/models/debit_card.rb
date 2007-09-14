class DebitCard < Payment

  def describe
    self.class.describe('debit_card')
  end


end
