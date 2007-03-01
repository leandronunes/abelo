class ContactPosition < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :organization_id
  
  belongs_to :organization
  has_many :contacts
end
