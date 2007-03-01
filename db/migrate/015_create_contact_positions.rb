class CreateContactPositions < ActiveRecord::Migration
  def self.up
    create_table :contact_positions do |t|
      t.column :name, :string, :null => false
      t.column :organization_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :contact_positions
  end
end
