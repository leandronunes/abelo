class UserProfile < ActiveRecord::Base

  validates_presence_of :user_id, :organization_id
  serialize :permissions, Array
  def validate
    unless self.permissions.kind_of? Array
      self.errors.add('permissions', '%{fn} must be a list of permissions')
    end
  end

  belongs_to :user
  belongs_to :organization

  # tells if an user with this profile is allowed to access the location
  # specified as a URL hash just like other methods in Rails.
  #
  # For example, suppose we have a profile without access to the <tt>edit</tt>
  # action of the <tt>main</tt> controller, but which has access to the
  # <tt>index</tt> action:
  #
  #   profile.allows(:controller => 'main', :action => 'index')   => true
  #   profile.allows(:controller => 'main', :action => 'edit')    => false
  def allows?(location)
    return false unless location[:organization_nickname] = self.organization.nickname
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
    ]
  }

  # detects the template used for this UserProfile, if any. Returns 'other'
  # if no template matches
  def template
    templates = TEMPLATES.select do |key, value|
      value == self.permissions
    end
    templates.first ? templates.first.first : 'other'
  end

  # assings the permission template to this instance of UserProfile.
  # * <tt>template</tt>: a string. Must be a key in the TEMPLATES hash.
  def template=(template)
    raise ArgumentError.new('%s is not a valid template' % template) unless TEMPLATES[template]
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
      'other' => _('Other')
    }[template]
  end

end
