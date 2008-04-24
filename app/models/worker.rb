class Worker < SystemActor

  belongs_to :category, :class_name => 'WorkerCategory', :foreign_key => 'category_id'
  has_many :worker_mass_mail_groups
  has_many :worker_groups, :through => :worker_mass_mail_groups, :foreign_key => 'mass_mail_group_id'

  after_create do |worker|
    worker.organization.update_tracker('worker_points', worker.organization.workers.count)
  end

  after_destroy do |worker|
    worker.organization.update_tracker('worker_points', worker.organization.workers.count) unless worker.organization.nil?
  end

end
