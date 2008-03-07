class ChangeProduct1 < ActiveRecord::Migration
  def self.up
    change_column :products, :code, :integer
  end

  def self.down
    change_column :products, :code, :string
  end
end
