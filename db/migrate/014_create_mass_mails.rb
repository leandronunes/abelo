class CreateMassMails < ActiveRecord::Migration
  def self.up
    create_table :mass_mails do |t|
      t.column :subject, :string, :null => false
      t.column :body, :text, :null => false
      t.column :organization_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :mass_mails
  end
end
