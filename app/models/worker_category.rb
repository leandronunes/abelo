class WorkerCategory < Category

  belongs_to :organization
  has_many :workers, :foreign_key => 'category_id'
  validates_uniqueness_of :name, :scope => [:organization_id], :message => _('The name %{fn} for worker category was already taken.')

end
