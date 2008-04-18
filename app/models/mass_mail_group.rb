class MassMailGroup < ActiveRecord::Base

  belongs_to :organization

  validates_presence_of :organization_id
  validates_presence_of :name

  def self.describe(name)
    {
      'worker' => _('Worker'),
      'workers' => _('Workers'),
      'customer' => _('Customer'),
      'customers' => _('Customers'),

    }[name] || name
  end

end
