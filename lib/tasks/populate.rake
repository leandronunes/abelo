require 'abelo'

namespace :db do

  desc "Populate essential information on database."
  task :populate => :environment do
    if User.find_by_login('admin').nil?
      admin = User.create({ :login => 'admin', :email => 'admin@localhost', :password => 'admin', :password_confirmation => 'admin', :administrator => true })
      Profile.create(:user => admin, :template => 'administration')
    end

    if Environment.default.nil?
      Environment.create!(:name => 'Default Environment', :is_default => true)
    end
    
  end

end
