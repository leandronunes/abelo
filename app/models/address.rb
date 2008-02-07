class Address < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  belongs_to :country, :class_name => 'BSC::Country', :foreign_key => :country_id
  belongs_to :state, :class_name => 'BSC::State', :foreign_key => :state_id
  belongs_to :city, :class_name => 'BSC::City', :foreign_key => :city_id

  validates_presence_of :country_id
  validates_presence_of :state_id
  validates_presence_of :city_id


end
