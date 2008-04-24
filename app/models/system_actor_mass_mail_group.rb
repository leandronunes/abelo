class SystemActorMassMailGroup < ActiveRecord::Base

  validates_presence_of :system_actor_id
  validates_presence_of :mass_mail_group_id

end
