class Organization < ActiveRecord::Base

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

  validates_presence_of :name, :cnpj, :nickname
  validates_uniqueness_of :name, :cnpj, :nickname

  validates_as_cnpj :cnpj
  validates_format_of :nickname, :with => /^[a-z0-9_]*$/, :message => '%{fn} can only contain downcase letters, numbers and "_"'

  def top_level_product_categories
    ProductCategory.top_level_for(self)
  end

end
