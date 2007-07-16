# == Schema Information
# Schema version: 35
#
# Table name: contacts
#
#  id          :integer       not null, primary key
#  name        :string(255)   not null
#  phone       :string(255)   
#  email       :string(255)   
#  customer_id :integer       not null
#  position_id :integer       not null
#

class Contact < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :customer_id, :message => 'Every contact must be associated to a customer'
  validates_presence_of :position_id, :message => 'Every contact must be associated to a position'

  belongs_to :customer
  belongs_to :position, :class_name => 'ContactPosition', :foreign_key => 'position_id'
end
