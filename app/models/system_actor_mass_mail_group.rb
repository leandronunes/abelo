class SystemActorMassMailGroup < ActiveRecord::Base

  validates_presence_of :system_actor_id
  validates_presence_of :mass_mail_group_id
#  validates_uniqueness_of :system_actor_id, :scope => [:mass_mail_group_id], :message => t(:this_system_actor_already_is_in_this_worker_group)
  
  belongs_to :system_actor
  belongs_to :mass_mail_group

  SYSTEM_ACTORS = ['Worker', 'Customer']

  def validate
    self.errors.add('system_actor', t(:this_type_of_system_actor_cannot_be_in_a_group)) if !SYSTEM_ACTORS.include?(self.system_actor.class.to_s)
    self.errors.add(t(:this_type_of_system_actor_cannot_be_in_this_type_of_group)) if self.system_actor.class.to_s != self.mass_mail_group.class.to_s.gsub('Group','')
  end

end
