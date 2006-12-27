class Supplier < ActiveRecord::Base

  belongs_to :organization
  has_and_belongs_to_many :products

  validates_presence_of :name, :cnpj, :organization_id
  validates_as_cnpj :cnpj

end
