class CreateMassMails < ActiveRecord::Migration
  def self.up
    create_table :mass_mails do |t|
      t.column :subject, :string
      t.column :body, :text
      t.column :organization_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :mass_mails
  end
end
