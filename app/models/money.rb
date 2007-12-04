class Money < Ledger

  validates_presence_of :category_id, :if => lambda{|money| money.class.to_s == 'Money' }

  def payment_method
    self.payment_method_choosen.nil? ? 'money' : self.payment_method_choosen
  end

end
