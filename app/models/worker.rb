class Worker < SystemActor

  belongs_to :category, :class_name => 'WorkerCategory', :foreign_key => 'category_id'

  after_create do |worker|
    worker.organization.tracker.worker_points ||= 0
    worker.organization.tracker.worker_points += 1
    worker.organization.tracker.save!
  end

end
