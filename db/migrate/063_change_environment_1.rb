class ChangeEnvironment1 < ActiveRecord::Migration
  def self.up
    add_column :environments, :home_page_id, :integer
  end

  def self.down
    remove_column :environments, :home_page_id
  end
end
