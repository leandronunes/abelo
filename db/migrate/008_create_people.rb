class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|

      ###############################################
      # single table inheritance field:
      ###############################################
      t.column :type, :string

      ###############################################
      # user's information
      ###############################################
      t.column :login,                     :string
      t.column :administrator,             :boolean, :default => false, :null => false
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
    end
  end

  def self.down
    drop_table :people
  end
end
