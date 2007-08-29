class CreateDisplayConfigurations < ActiveRecord::Migration
  def self.up
    create_table :display_configurations do |t|
      t.column :type,               :string
      t.column :configuration_id,   :integer, :null => false
      t.column :field,              :string
      t.column :display_in_list,    :boolean, :default => false
      t.column :break_line,         :boolean, :default => false
      t.column :position,           :integer
    end
  end

  def self.down
    drop_table :display_configurations
  end
end
