class CreateBanks < ActiveRecord::Migration
  def self.up
    create_table :banks do |t|
      t.column :name,  :string, :null => false
      t.column :code,  :string, :null => false
      t.column :site,  :string
    end
  end

  def self.down
    drop_table :banks
  end
end
