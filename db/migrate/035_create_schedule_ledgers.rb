class CreateScheduleLedgers < ActiveRecord::Migration
  def self.up
    create_table :schedule_ledgers do |t|
      t.column :periodicity_id,  :integer
      t.column :start_date,      :date
      t.column :interval,        :date
    end
  end

  def self.down
    drop_table :schedule_ledgers
  end
end
