# This class is used on point of sale operations to realize add cash of till
class AddCash < Money

  def validate
    if self.date != Date.today
      self.errors.add(:date, _('You cannot schedule an add cash')) 
    end

    if self.type_of != Payment::TYPE_OF_INCOME
      self.errors.add(:type_of, _('You cannot have an add cash with type different of %s') % Payment::TYPE_OF_INCOME) 
    end
  end

end
