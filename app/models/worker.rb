class Worker < ActiveRecord::Base

  belongs_to :organization

  validates_presence_of :name, :organization_id
  validates_as_cpf :cpf

end
