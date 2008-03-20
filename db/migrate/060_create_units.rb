class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.column :name,                :string, :null => false
      t.column :abbreviation,        :string, :null => false
      t.column :organization_id,     :integer
    end
  end

  def self.down
    drop_table :units
  end
end
