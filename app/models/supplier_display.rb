class SupplierDisplay < SystemActorDisplay
  validates_uniqueness_of :field, :scope => :configuration_id

end
