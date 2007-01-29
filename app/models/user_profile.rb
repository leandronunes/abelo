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

end
