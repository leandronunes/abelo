# this migratino defines the stock_entries table for holdind all stock movement
# records, which includes both adding to stock and removing from stock.
class CreateStockEntries < ActiveRecord::Migration
  def self.up
    create_table :stock_entries do |t|

      ###########################################
      ### Single-table inheritance infrastructure
      ###########################################
      # the type of entry
      t.column :type, :string, :null => false

      ###############################################
      ### Fields common for both StockIn and StockOut
      ###############################################
      # the product that is entering/exiting the stock
      t.column :product_id, :integer, :null => false
      # how much of it
      t.column :ammount, :float, :null => false
      # the purpose of this entry. Can be 'sell' (indicating the products are
      # entering/leaving the stock for being sold), or 'production' (meaning
      # that the item are getting into the stock to be used in a production
      # process.
      t.column :purpose, :string, :null => false
      # the date when the entry is created
      t.column :date, :date, :null => false

      ###############################
      ### fields used only by StockIn
      ###############################
      # from who we bought the items
      t.column :supplier_id, :integer
      # the price paid
      t.column :price, :float
      # the validity of the product
      t.column :validity, :date

      ################################
      ### fields used only by StockOut
      ################################
      # in the case the entry is related to a sell, it must indicate which one
      t.column :sell_id, :integer
    end
  end

  def self.down
    drop_table :stock_entries
  end
end
