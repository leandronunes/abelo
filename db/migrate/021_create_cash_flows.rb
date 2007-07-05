class CreateCashFlows < ActiveRecord::Migration
  def self.up
    create_table :cash_flows do |t|
      t.column :historical_id,     :int,      :null => false
      t.column :value,             :float,    :null => false
      t.column :date,              :date,     :null => false
      t.column :specification_id,  :int
      t.column :organization_id,   :int,      :null => false
      t.column :sale_id,           :int

      #Identifies foreseen cash flows for generate foressen extract of 'cash flow 
      t.column :foreseen,          :boolean,  :null => false, :default => false
    end
  end

  def self.down
    drop_table :cash_flows
  end
end
