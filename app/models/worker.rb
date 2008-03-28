class Worker < SystemActor

  belongs_to :category, :class_name => 'WorkerCategory', :foreign_key => 'category_id'

  before_create do |worker|
    worker.organization.tracker.worker_points ||= 0
    worker.organization.tracker.worker_points += 1
  end

end
