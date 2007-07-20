class CreateSystemActors < ActiveRecord::Migration
  def self.up
    create_table :system_actors do |t|
      #common
      t.column :name, :string, :null => false
      t.column :organization_id, :integer, :null => false
      t.column :address, :string
      t.column :description, :text
      t.column :email, :string
      t.column :type, :string
      t.column :category_id, :integer

      #organizations specific
      t.column :cnpj, :string, :limit => 14

      #people specific
      t.column :cpf, :string, :limit => 11
      t.column :rg, :string
      t.column :born_day, :date
    end
  end

  def self.down
    drop_table :system_actors
  end
end
