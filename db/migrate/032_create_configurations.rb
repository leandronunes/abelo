class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.column :is_model,           :boolean
      t.column :name,               :string
      t.column :description,        :text
      t.column :organization_id,    :interger
      t.column :full_product,       :text
      t.column :lite_product,       :text
      t.column :department_name,    :string
      t.column :product_name,       :string
      t.column :customer_name,      :string
      t.column :organization_name,  :string
    end
  end

  def self.down
    drop_table :configurations
  end
end
