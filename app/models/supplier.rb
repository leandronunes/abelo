class Supplier < ActiveRecord::Base

  belongs_to :organization

  validates_presence_of :name, :cnpj, :organization_id
  validates_as_cnpj :cnpj

end
