class Organization < ActiveRecord::Base

  validates_presence_of :name
  validates_as_cnpj :cnpj
  validates_presence_of :nickname

end
