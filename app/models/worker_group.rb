class WorkerGroup < MassMailGroup

  has_many :worker_mass_mail_groups
  has_many :workers, :through => :worker_mass_mail_groups #, :foreign_key => 'system_actor_id'

  validates_uniqueness_of :name, :scope => [:organization_id], :message => _('The name %{fn} for worker group was already taken.')
end
