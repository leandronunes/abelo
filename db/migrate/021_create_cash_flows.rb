class CreateCashFlows < ActiveRecord::Migration
  def self.up
    create_table :cash_flows do |t|
      t.column :historical_id, :int
      t.column :value, :float
      t.column :date, :date
      t.column :specification, :string
    end
  end

  def self.down
    drop_table :cash_flows
  end
end
