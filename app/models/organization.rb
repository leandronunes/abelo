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
  has_many :historicals

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

  def operational_entrances
    return filter_historicals('t', TypeTransaction::CREDIT)
  end

  def operational_exits
    return filter_historicals('t', TypeTransaction::DEBIT)
  end

  def not_operational_entrances
    return filter_historicals('f', TypeTransaction::CREDIT)
  end

  def not_operational_exits
    return filter_historicals('f', TypeTransaction::DEBIT)
  end

  def historical_total_value(id)
    value = 0.0
    self.cash_flows.each { |c|
      if c.historical_id == id
        value = value + c.value
      end
    }
    return value
  end

  def customers_by_products(list_products)
    customers = []
    self.sales.each { |s|
      customers = s.customers_products(list_products, self)
    }
    return customers
  end

  def customers_by_categories(list_categories)
    customers = []
    list_categories.each { |k|
      cat = self.customer_categories.find(k)
      if cat
        customers.concat(cat.customers)
      end
    }
    return customers
  end

  private

  def filter_historicals(operational, type_transaction)
    return self.historicals.find(:all, :conditions => "operational = '#{operational}' AND type_of = '#{type_transaction}'" )
  end

end
