class Contact < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :customer_id, :message => 'Every contact must be associated to a customer'
  validates_presence_of :position_id, :message => 'Every contact must be associated to a position'

  belongs_to :customer
  belongs_to :position, :class_name => 'ContactPosition', :foreign_key => 'position_id'
end
