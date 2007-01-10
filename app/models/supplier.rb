class Supplier < ActiveRecord::Base

  belongs_to :organization
  has_and_belongs_to_many :products

  validates_presence_of :name, :organization_id
  validates_as_cnpj :cnpj
  validates_as_cpf :cpf

  def validate
    if (! self.cpf.nil?) && (! self.cnpj.nil?)
      errors.add('cnpj', 'Either %{fn} or CPF must be filled, and they cannot be filled at the same time.')
    end
  end

end
