class CustomerGroup < MassMailGroup

  validates_uniqueness_of :name, :scope => [:organization_id], :message => _('The name %{fn} for customer group was already taken.')

  def customers
    self.system_actors
  end

end
