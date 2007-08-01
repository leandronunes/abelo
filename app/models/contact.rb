class Contact < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :system_actor_id, :message => 'Every contact must be associated to an actor'
  validates_presence_of :category_id, :message => 'Every contact must belongs to a cetegory'
  belongs_to :system_actor
end
