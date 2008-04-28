class Worker < SystemActor

  belongs_to :category, :class_name => 'WorkerCategory', :foreign_key => 'category_id'

  after_create do |worker|
    worker.organization.update_tracker('worker_points', worker.organization.workers.count)
  end

  after_destroy do |worker|
    worker.organization.update_tracker('worker_points', worker.organization.workers.count) unless worker.organization.nil?
  end

end
