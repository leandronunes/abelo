class CreateOrganizations < ActiveRecord::Migration

  def self.up
    create_table :organizations do |t|
      t.column :name,                        :string, :null => false
      t.column :cnpj,                        :string
      t.column :design_data,                 :text
      t.column :point_of_sale_design_data,   :text
      t.column :web_site_design_data,        :text
      t.column :presentation,                :text
      t.column :identifier,                  :string, :null => false
      t.string :trade_name, :null => false, :default => ''
      t.string :state_registration, :responsible_person
    end
  end

  def self.down
    drop_table :organizations
  end
end
