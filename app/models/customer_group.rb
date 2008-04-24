class CustomerGroup < MassMailGroup

  has_many :customer_mass_mail_groups
  has_many :customers, :through => :customer_mass_mail_groups, :foreign_key => 'system_actor_id'

  validates_uniqueness_of :name, :scope => [:organization_id], :message => _('The name %{fn} for customer group was already taken.')
end
