class CreateInterests < ActiveRecord::Migration
  def self.up
    create_table :interests do |t|
      t.column :value,   :float,               :null => false
      t.column :period,  :string, :limit => 1, :null => false
    end
  end

  def self.down
    drop_table :interests
  end
end
