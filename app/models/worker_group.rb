class WorkerGroup < MassMailGroup

  validates_uniqueness_of :name, :scope => [:organization_id], :message => t(:the_name_was_already_taken)

  def workers
    self.system_actors
  end

end
