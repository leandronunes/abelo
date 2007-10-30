class Customer < SystemActor

  belongs_to :category, :class_name => 'CustomerCategory', :foreign_key => 'category_id'

#  def ledgers_by_sales
#    Sale.ledgers_by_customer(self)  
#  end

end
