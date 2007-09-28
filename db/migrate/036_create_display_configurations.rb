class CreateDisplayConfigurations < ActiveRecord::Migration
  def self.up
    create_table :display_configurations do |t|
      t.column :owner_type,         :string
      t.column :owner_id,           :integer
      t.column :type,               :string
      t.column :configuration_id,   :integer
      t.column :field,              :string
      t.column :position,           :integer
      t.column :settings,           :text
    end
  end

  def self.down
    drop_table :display_configurations
  end
end
