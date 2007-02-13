class Contact < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :customer_id, :message => 'Every contact must be associated to a customer'

  belongs_to :customer
end
