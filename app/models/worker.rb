class Worker < SystemActor

  belongs_to :category, :class_name => 'WorkerCategory', :foreign_key => 'category_id'
  has_many :documents, :as => :owner

end
