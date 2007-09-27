class BscPluginMigration < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.column :name, :string
    end

    create_table :states do |t|
      t.column :name,        :string
      t.column :code,        :string
      t.column :country_id,  :integer
    end

    create_table :cities do |t|
      t.column :name,      :string
      t.column :state_id,  :integer
      t.column :zip_code,  :string
    end

  end

  def self.down
    drop_table :cities
    drop_table :states
    drop_table :countries
  end
end

