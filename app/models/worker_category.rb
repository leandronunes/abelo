class WorkerCategory < Category

 belongs_to :organization
 has_many :workers, :foreign_key => 'category_id'

end
