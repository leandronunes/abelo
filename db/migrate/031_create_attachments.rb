class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.column :mass_mail_id,  :interger, :null => false
    end
  end

  def self.down
    drop_table :attachments
  end
end
