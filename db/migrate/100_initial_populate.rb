class InitialPopulate < ActiveRecord::Migration
  def self.up
    if User.find_by_login('admin').nil?
      admin = User.create({ :login => 'admin', :email => 'admin@localhost', :password => 'admin', :password_confirmation => 'admin', :administrator => true })
      Profile.create(:user => admin, :template => 'administration')
    end

    if Environment.default.nil?
      Environment.create!(:name => 'Default Environment', :is_default => true)
    end

  end

  def self.down
    unless User.find_by_login('admin').nil?
      User.find_by_login('admin').destroy
    end
    unless Environment.default.nil?
      Environment.default.destroy
    end
  end
end
