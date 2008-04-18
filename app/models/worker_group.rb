class WorkerGroup < MassMailGroup

  belongs_to :organization

  validates_associated :organization
  validates_associated :system_actor_mass_mail_groups

  has_many :system_actor_mass_mail_groups
  has_many :workers, :through => :system_actor_mass_mail_groups, :foreign_key => 'system_actor_id'

  validates_uniqueness_of :name, :scope => [:organization_id], :message => _('The name %{fn} for worker group was already taken.')
end
