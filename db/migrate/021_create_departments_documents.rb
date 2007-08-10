class CreateDepartmentsDocuments < ActiveRecord::Migration
  def self.up
    create_table :departments_documents, :id => false do |t|
      t.column :document_id, :integer, :null => false
      t.column :department_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :departments_documents
  end
end
