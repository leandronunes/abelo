class CreateTills < ActiveRecord::Migration
  def self.up
    create_table :tills do |t|
      t.column :datetime,           :datetime, :null => false
      t.column :status,             :integer, :default => 0
      t.column :printer_id,         :string, :null => false
      t.column :user_id,            :integer, :null => false
      t.column :organization_id,    :integer, :null => false
    end
  end

  def self.down
    drop_table :tills
  end
end
