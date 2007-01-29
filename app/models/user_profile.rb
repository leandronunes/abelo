#

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

end
