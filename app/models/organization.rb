class Organization < ActiveRecord::Base

  has_many :products

  validates_presence_of :name, :cnpj, :nickname
  validates_uniqueness_of :name, :cnpj, :nickname

  validates_as_cnpj :cnpj
  validates_format_of :nickname, :with => /^[a-z0-9_]*$/, :message => '%{fn} can only contain downcase letters, numbers and "_"'

end
