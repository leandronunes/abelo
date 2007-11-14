class CreateDefaultAdminUser < ActiveRecord::Migration
  def self.up
    admin = User.create({ :login => 'admin', :email => 'admin@localhost', :password => 'admin', :password_confirmation => 'admin', :administrator => true })
    Profile.create(:user => admin, :template => 'administration')
  end

  def self.down
    User.find_by_login('admin').destroy
  end
end
