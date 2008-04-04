class CreateTrackers < ActiveRecord::Migration
  def self.up
    create_table :trackers do |t|
      t.column :available_points,          :integer, :default => 0
      t.column :organization_id,           :integer
      t.column :product_points,            :integer, :default => 0
      t.column :customer_points,           :integer, :default => 0
      t.column :supplier_points,           :integer, :default => 0
      t.column :worker_points,             :integer, :default => 0
      t.column :ledger_points,             :integer, :default => 0
      t.column :document_points,           :integer, :default => 0
      t.column :points_per_user,           :integer, :default => 0
      t.column :points_per_web_site,       :integer, :default => 0
    end

    Organization.find(:all) do |o|
      t = Tracker.new
      t.available_points = 500
      t.organization = o
      t.product_points = o.products.length
      t.customer_points = o.customers.length
      t.supplier_points = o.suppliers.length
      t.worker_points = o.workers.length
      t.ledger_points = o.ledgers.length
      t.document_points = o.documents.length
      t.save!
    end
  end

  def self.down
    drop_table :trackers
  end
end
