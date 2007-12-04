class AddColumnLedgers < ActiveRecord::Migration
  include Status

  def self.up
    ledgers_hash = Ledger.find(:all).collect{|l| {l.id => l.is_foreseen} }
    remove_column :ledgers, :is_foreseen
    add_column :ledgers, :status, :integer, :default => 0
    ledgers_hash.collect{ |lh| 
      lh.each{ |k,v| 
        l = Ledger.find(k)
        l.is_foreseen= v
        l.save
      }
    }
  end

  def self.down
    ledgers_hash = Ledger.find(:all).collect{|l| {l.id => l.is_foreseen} }
    remove_column :ledgers, :status
    add_column :ledgers, :is_foreseen, :boolean,  :null => false, :default => false
    ledgers_hash.collect{ |lh| 
      lh.each{ |k,v| 
        l = Ledger.find(k)
        l[:is_foreseen]= v
        l.save
      }
    }
  end
end
