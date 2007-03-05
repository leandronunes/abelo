class CreateWorkers < ActiveRecord::Migration
  def self.up
    create_table :workers do |t|
      t.column :name, :string, :null => false
      t.column :cpf, :string, :limit => 11
      t.column :rg, :string
      t.column :address, :string
      t.column :birthday, :date
      t.column :description, :text
      t.column :function, :string
      t.column :organization_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :workers
  end
end
