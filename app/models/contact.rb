# == Schema Information
# Schema version: 35
#
# Table name: contacts
#
#  id          :integer       not null, primary key
#  name        :string(255)   not null
#  phone       :string(255)   
#  email       :string(255)   
#  system_actor_id :integer   not null
#  category_id :integer       not null
#

class Contact < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :system_actor_id, :message => 'Every contact must be associated to an actor'
  validates_presence_of :category_id, :message => 'Every contact must belongs to a cetegory'
  belongs_to :system_actor
end
