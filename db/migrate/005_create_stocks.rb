# this migratino defines the stocks table for holdind all stock movement
# records, which includes both adding to stock and removing from stock.
class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|

      ###########################################
      ### Single-table inheritance infrastructure
      ###########################################
      # the type of entry
      t.column :type, :string, :null => false

      ###############################################
      ### Fields common for both StockIn and StockOut
      ###############################################
      # the product that is entering/exiting the stock
      t.column :price, :float
      t.column :product_id, :integer, :null => false
      # how much of it
      t.column :amount, :float, :null => false
      # the purpose of this entry. Can be 'sell' (indicating the products are
      # entering/leaving the stock for being sold), or 'production' (meaning
      # that the item are getting into the stock to be used in a production
      # process.
      t.column :purpose, :integer, :default => 0
      t.column :status, :integer, :default => 0
      # the date when the entry is created
      t.column :date, :date

      ###############################
      ### fields used only by StockIn
      ###############################
      # from who we bought the items
      t.column :supplier_id, :integer
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
    drop_table :stocks
  end
end
