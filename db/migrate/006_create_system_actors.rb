class CreateSystemActors < ActiveRecord::Migration
  def self.up
    create_table :system_actors do |t|
      #common
      t.column :name,            :string,  :null => false
      t.column :organization_id, :integer, :null => false
      t.column :address,         :string
      t.column :description,     :text
      t.column :email,           :string,  :null => false
      t.column :type,            :string
      t.column :category_id,     :integer, :null => false

      #organizations specific
      t.column :cnpj, :string

      #people specific
      t.column :cpf,             :string
      t.column :rg,              :string
      t.column :birthday,        :date
    end
  end

  def self.down
    drop_table :system_actors
  end
end
