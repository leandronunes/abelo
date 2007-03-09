class Worker < ActiveRecord::Base

  belongs_to :organization

  validates_presence_of :name, :organization_id, :cpf
  validates_as_cpf :cpf

  validates_uniqueness_of :cpf, :scope => :organization_id, :if => lambda { |user| ! user.cpf.blank? }, :message => 'There is another worker with this %{fn}'

end
