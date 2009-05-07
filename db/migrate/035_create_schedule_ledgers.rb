class CreateScheduleLedgers < ActiveRecord::Migration
  def self.up
    create_table :schedule_ledgers do |t|
      t.references :periodicity
      t.timestamps
      t.integer :interval
    end
  end

  def self.down
    drop_table :schedule_ledgers
  end
end
