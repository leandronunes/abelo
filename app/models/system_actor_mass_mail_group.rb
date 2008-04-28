class SystemActorMassMailGroup < ActiveRecord::Base

  validates_presence_of :system_actor_id
  validates_presence_of :mass_mail_group_id
  validates_uniqueness_of :system_actor_id, :scope => [:mass_mail_group_id], :message => _('This system actor already is in this worker group.')
  
  belongs_to :system_actor
  belongs_to :mass_mail_group

  SYSTEM_ACTORS = ['Worker', 'Customer']

  def validate
    self.errors.add('system_actor', _('This type of system actor cannot be in a group')) if !SYSTEM_ACTORS.include?(self.system_actor.class.to_s)
    self.errors.add(_('This type of system actor cannot be in this type of group')) if self.system_actor.class.to_s != self.mass_mail_group.class.to_s.gsub('Group', '')
  end

end
