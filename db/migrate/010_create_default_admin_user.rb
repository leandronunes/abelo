class CreateDefaultAdminUser < ActiveRecord::Migration
  def self.up
    User.create({ :login => 'admin', :email => 'admin@localhost', :password => 'admin', :password_confirmation => 'admin', :administrator => true })
  end

  def self.down
    User.find_by_login('admin').destroy
  end
end
