class MassMailGroup < ActiveRecord::Base

  validates_presence_of :name
  validates_associated :system_actor_mass_mail_groups

  has_many :system_actor_mass_mail_groups
  has_many :system_actors, :through => :system_actor_mass_mail_groups
end
