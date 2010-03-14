class MassMailGroup < ActiveRecord::Base

  belongs_to :organization

  validates_associated :organization
  validates_presence_of :organization_id
  validates_presence_of :name
  
  has_many :system_actor_mass_mail_groups, :dependent => :destroy
  has_many :system_actors, :through => :system_actor_mass_mail_groups
  
#  acts_as_ferret :remote => true

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end

  def self.describe(name)
    {
      'worker' => I18n.t(:worker),
      'workers' => I18n.t(:workers),
      'customer' => I18n.t(:customer),
      'customers' => I18n.t(:customers),

    }[name] || name
  end

end
