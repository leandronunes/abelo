class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      #t.column :description, :string, :null => false
      t.column :file, :string, :null => false
      t.column :mass_mail_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :attachments
  end
end
