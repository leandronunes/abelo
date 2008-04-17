class SystemActorMassMailGroup < ActiveRecord::Base

  belongs_to :system_actor
  belongs_to :mass_mail_group  

  validates_presence_of :system_actor_id
  validates_presence_of :mass_mail_group_id
end
