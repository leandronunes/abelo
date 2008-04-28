class MassMailGroup < ActiveRecord::Base

  belongs_to :organization

  validates_associated :organization
  validates_presence_of :organization_id
  validates_presence_of :name
  
  has_many :system_actor_mass_mail_groups
  has_many :system_actors, :through => :system_actor_mass_mail_groups

  def self.describe(name)
    {
      'worker' => _('Worker'),
      'workers' => _('Workers'),
      'customer' => _('Customer'),
      'customers' => _('Customers'),

    }[name] || name
  end

end
