class WorkerGroup < MassMailGroup

  validates_uniqueness_of :name, :scope => [:organization_id], :message => _('The name %{fn} for worker group was already taken.')

  def workers
    self.system_actors
  end

end
