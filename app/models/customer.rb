class Customer < SystemActor

  belongs_to :category, :class_name => 'CustomerCategory', :foreign_key => 'category_id'

  def self.configuration_class
    CustomerDisplay
  end

end
