class Money < Ledger

  validates_presence_of :category_id, :if => lambda{|money| money.class.class_name == 'Money' }

end
