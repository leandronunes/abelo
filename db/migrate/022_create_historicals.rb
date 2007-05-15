class CreateHistoricals < ActiveRecord::Migration
  def self.up
    create_table :historicals do |t|
      t.column :name, :string
      t.column :type, :char
    end
  end

  def self.down
    drop_table :historicals
  end
end
