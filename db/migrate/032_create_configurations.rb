class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.column :organization_id,    :integer
      t.column :is_model,           :boolean
      t.column :name,               :string
      t.column :description,        :text
      t.column :settings,           :text
#TODO remove this
#      t.column :department_name,    :string
#      t.column :product_name,       :string
#      t.column :customer_name,      :string
#      t.column :organization_name,  :string
    end
  end

  def self.down
    drop_table :configurations
  end
end
