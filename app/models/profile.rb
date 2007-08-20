# A Profile is the representation and web-presence of an individual or an
# organization. Every Profile is attached to its VirtualCommunity of origin,
# which by default is the one returned by VirtualCommunity:default.
class Profile < ActiveRecord::Base

  belongs_to :organization
  belongs_to :user

  validates_presence_of :user_id

  serialize :permissions, Array

  def save
    self.permissions = Array.new if self.permissions.nil?
    super
  end

  def validate
    unless self.permissions.kind_of? Array
      self.errors.add('permissions', '%{fn} must be a list of permissions')
    end
    if !self.user.nil? and self.user.administrator and !self.organization.nil?
      self.errors.add('organization_id', 'An administrator user cannot be associated to an organization')
    end
    if !self.user.nil? and !self.user.administrator and self.organization.nil?
      self.errors.add('organization_id', 'An administrator user cannot be associated to an organization')
    end
  end


  # For example, suppose we have a profile without access to the <tt>edit</tt>
  # action of the <tt>main</tt> controller, but which has access to the
  # <tt>index</tt> action:
  #
  #   profile.allows(:controller => 'main', :action => 'index')   => true
  #   profile.allows(:controller => 'main', :action => 'edit')    => false
  def allows?(location)
    return false unless  self.organization.nil? or (location[:organization_nickname] = self.organization.nickname)
    test = location.reject { |key,value| key == :organization_nickname }
    self.permissions.any? do |permission|
      test.all? do |key,value|
        (value == permission[key]) || (permission[key] == '*')
      end
    end
  end


  # defined permission templates
  TEMPLATES = {
    'full_access' => [
      { :controller => '*', :action => '*' }
    ],
    'read_only' => [
      { :controller => '*', :action => 'index'},
      { :controller => '*', :action => 'list'},
      { :controller => '*', :action => 'show'}
    ],
    'sales_person' => [
      { :controller => 'point_of_sale', :action => '*' }
    ],
    'financial' => [
      { :controller => 'ledgers', :action => '*' },
      { :controller => 'ledger_categories', :action => '*' },
      { :controller => 'bank_accounts', :action => '*' },
    ],
    'administration' => [
      { :controller => 'organizations', :action => '*' },
      { :controller => 'admin_configurations', :action => '*' },
      { :controller => 'banks', :action => '*' },
    ],
    'organization_management' => [
      { :controller => 'categories', :action => '*' },
      { :controller => 'stock', :action => '*' },
      { :controller => 'store', :action => '*' },
      { :controller => 'permissions', :action => '*' },
      { :controller => 'system_actors', :action => '*' },
      { :controller => 'point_of_sale', :action => '*' },
      { :controller => 'mass_mails', :action => '*' },
      { :controller => 'ledgers', :action => '*' },
      { :controller => 'ledger_categories', :action => '*' },
      { :controller => 'documents', :action => '*' },
      { :controller => 'departments', :action => '*' },
      { :controller => 'main', :action => '*' },
      { :controller => 'products', :action => '*' },
      { :controller => 'bank_accounts', :action => '*' },
    ]
  }

  # detects the template used for this Profile, if any. Returns 'other'
  # if no template matches
  def template
    templates = TEMPLATES.select do |key, value|
      value == self.permissions
    end
    templates.first ? templates.first.first : 'other'
  end

  # assings the permission template to this instance of Profile.
  # * <tt>template</tt>: a string. Must be a key in the TEMPLATES hash.
  def template=(template)
    raise ArgumentError.new("%s is not a valid template" % template) unless TEMPLATES[template]
    self.permissions = TEMPLATES[template]
  end

  # Describes the permissions granted comparing them with the templates in this
  # class.
  def description
    self.class.describe(self.template)
  end

  # maps a template code (a key in TEMPLATES) to an human-readable string
  def self.describe(template)
    return {
      'full_access' => _('Full access'),
      'read_only' => _('Read-only'), 
      'sales_person' => _('Sales person'), 
      'financial' => _('Financial'), 
      'organization_management' => _('Organization Management'), 
      'administration' => _('Administration'), 
      'other' => _('Other')
    }[template]
  end

end
