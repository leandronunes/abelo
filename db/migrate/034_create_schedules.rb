class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.column :created_at, :datetime, :null => false
    #  t.column :updated_at, :datetime, :null => true
    #  t.column :completed_at, :datetime, :null => false
    #  t.column :rest_time, :integer, :null => true
    #  t.column :frequency, :char
    #  t.column :category_id
    #  t.column :description
    #  t.column :value, :decimal, :precision => 8, :scale => 2, :null => false
    end
  end

  def self.down
    drop_table :schedules
  end
end
