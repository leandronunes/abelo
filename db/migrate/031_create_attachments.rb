class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
    end
  end

  def self.down
    drop_table :attachments
  end
end
