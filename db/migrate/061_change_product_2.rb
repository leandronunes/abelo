class ChangeProduct2 < ActiveRecord::Migration
  def self.up
    add_column :products, :unit_id, :integer
    Product.find(:all).map do |p|
      organization = p.organization
      unit = organization.units.find_by_abbreviation(p.unit)
      if unit.nil?
        unit = Unit.create!(:organization => organization, :name => p.unit, :abbreviation => p.unit)
      end
      p.unit_measure = unit
      p.save
    end
    remove_column :products, :unit
  end

  def self.down
    add_column :products, :unit, :string
    Product.find(:all).map do |p|
      p.unit = p.unit_measure.abbreviation
      p.save
    end
    remove_column :products, :unit_id
  end
end
