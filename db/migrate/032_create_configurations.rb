class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.column :organization_id,    :integer
      t.column :is_model,           :boolean
      t.column :name,               :string
      t.column :description,        :text
      t.column :settings,           :text
    end
  end

  def self.down
    drop_table :configurations
  end
end
