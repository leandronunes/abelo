# == Schema Information
# Schema version: 35
#
# Table name: workers
#
#  id              :integer       not null, primary key
#  name            :string(255)   not null
#  cpf             :string(11)    
#  rg              :string(255)   
#  address         :string(255)   
#  birthday        :date          
#  description     :text          
#  function        :string(255)   
#  organization_id :integer       not null
#

class Worker < ActiveRecord::Base

  belongs_to :organization

  validates_presence_of :name, :organization_id, :cpf
  validates_as_cpf :cpf

  validates_uniqueness_of :cpf, :scope => :organization_id, :if => lambda { |user| ! user.cpf.blank? }, :message => 'There is another worker with this %{fn}'

end
