class CreateUnitMeasures < ActiveRecord::Migration
  def self.up
    create_table :unit_measures do |t|
      t.column :name,                :string, :null => false
      t.column :abbreviation,        :string, :null => false
      t.column :organization_id,     :integer
    end
  end

  def self.down
    drop_table :unit_measures
  end
end
