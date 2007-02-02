ActiveRecord::Schema.define do
  create_table :cpfs, :force => true do |t|
    t.column :id, :string, :null => true
    t.column :cpf, :string, :null => true
  end
end
