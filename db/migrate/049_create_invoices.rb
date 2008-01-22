class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.column :number,       :string
      t.column :serie,        :string
      t.column :issue_date,   :datetime 
      t.column :status,       :integer, :default => 0
      t.column :supplier_id,  :integer
    end
  end

  def self.down
    drop_table :invoices
  end
end
