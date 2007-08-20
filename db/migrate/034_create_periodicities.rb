class CreatePeriodicities < ActiveRecord::Migration
  def self.up
    create_table :periodicities do |t|
      t.column :name,            :string, :null => false
      t.column :number_of_days,  :integer, :null => false
      t.column :organization_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :periodicities
  end
end
