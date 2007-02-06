class Customer < ActiveRecord::Base

  belongs_to :organization
  belongs_to :category, :class_name => 'CustomerCategory', :foreign_key => 'category_id'
  validates_presence_of :name
  
  validates_presence_of :organization_id, :message => 'Customers must be associated to an organization'

  validates_presence_of :category_id, :message => 'Every customer must belong to a category'
  
  validates_as_cnpj :cnpj
  
  validates_as_cpf :cpf

  validates_uniqueness_of :cnpj, :scope => :organization_id, :if => lambda { |user| ! user.cnpj.blank? }, :message => 'There is another supplier with this %{fn}'
  validates_uniqueness_of :cpf, :scope => :organization_id, :if => lambda { |user| ! user.cpf.blank? }, :message => 'There is another supplier with this %{fn}'

  def validate
    
    if ((! self.cpf.blank?) && (! self.cnpj.blank?)) || (self.cpf.blank? && self.cnpj.blank?)
      errors.add('cnpj', 'Either %{fn} or CPF must be filled, and they cannot be filled at the same time.')
    end
  end

end
