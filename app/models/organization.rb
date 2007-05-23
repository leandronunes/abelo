class Organization < ActiveRecord::Base

  validates_presence_of :name, :cnpj, :nickname
  validates_uniqueness_of :name, :cnpj, :nickname
  validates_as_cnpj :cnpj
  validates_format_of :nickname, :with => /^[a-z0-9_]*$/, :message => '%{fn} can only contain downcase letters, numbers and "_"'
  
  has_many :departments
  has_many :products
  has_many :product_categories
  has_many :customer_categories
  has_many :suppliers
  has_many :user_profiles
  has_many :users, :through => :user_profiles
  has_many :customers
  has_many :contacts, :through => :customers
  has_many :contact_positions
  has_many :workers
  has_many :sales
  has_many :mass_mails
  has_many :commercial_proposals
  has_many :cash_flows

  def top_level_product_categories
    ProductCategory.top_level_for(self)
  end

  def pending_sales(user)
    return Sale.pending(self, user)
  end

  def commercial_proposals_templates
    return self.commercial_proposals.select{ |c| c.is_template? }
  end

  def commercial_proposals_not_templates
    return self.commercial_proposals.select{ |c| !c.is_template? }
  end

  def historicals
    h = Array.new
    self.cash_flows.each { |c|
      h.push(c.historical)
    }
    return h
  end

  def historical_total_value(name)
    value = 0.0
    self.cash_flows.each { |c|
      if c.historical.name == name
        value = value + c.value
      end
    }
    return value
  end 

end
