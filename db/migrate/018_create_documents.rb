class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.column :name,              :string,  :null => false
      t.column :is_model,          :boolean, :default => false
      t.column :organization_id,   :integer, :null => false
      t.column :document_model_id, :integer
      t.column :body,              :text
    end
  end

  def self.down
    drop_table :documents
  end
end
