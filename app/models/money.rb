class Money < Ledger

  validates_presence_of :category_id, :if => lambda{|money| money.class.to_s == 'Money' }

end
