class ChangeSales1 < ActiveRecord::Migration
  def self.up
    add_column :sales, :till_id, :integer

    Sale.find(:all).map do |s|
      s.till = s.owner
      s.save!
    end

    remove_column :sales, :owner_type
    remove_column :sales, :owner_id
  end

  def self.down
    add_column :sales, :owner_type, :integer
    add_column :sales, :owner_id, :integer

    Sale.find(:all).map do |s|
      next unless s.respond_to?(:owner)
      s.owner = s.till
      s.save!
    end

    remove_column :sales, :till_id
  end
end
