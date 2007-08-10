class CreateDocumentSections < ActiveRecord::Migration
  def self.up
    create_table :document_sections do |t|
       t.column :name,                    :string,  :null => false
       t.column :document_id,  :integer, :null => false
    end
  end

  def self.down
    drop_table :document_sections
  end
end
