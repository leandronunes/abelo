class CreateTrackers < ActiveRecord::Migration
  def self.up
    create_table :trackers do |t|
      t.column :available_points,          :integer
      t.column :specific_trackers,         :text
      t.column :organization_id,           :integer
    end

    Organization.find(:all) do |o|
      t = Tracker.new
      t.available_points = 500
      t.organization = o
      t.save!
    end
  end

  def self.down
    drop_table :trackers
  end
end
