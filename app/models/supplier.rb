# == Schema Information
# Schema version: 35
#
# Table name: suppliers
#
#  id              :integer       not null, primary key
#  name            :string(255)   not null
#  cnpj            :string(14)    
#  organization_id :integer       not null
#  address         :string(255)   
#  birthday        :date          
#  cpf             :string(11)    
#  rg              :string(255)   
#  description     :text          
#

class Supplier < ActiveRecord::Base

  belongs_to :organization
  has_and_belongs_to_many :products

  validates_presence_of :name, :organization_id
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
