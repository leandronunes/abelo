# This class is used on point of sale operations to realize remove cash of till
class RemoveCash < Money
  
  before_validation do |cash|
    cash.value = cash.value * -1 if cash.value > 0
  end
  
  def validate
    if self.date != Date.today
      self.errors.add(:date, _('You cannot schedule an add cash'))
    end

    if self.value >= 0
      self.errors.add(:value, _('The value must be minor or equal to 0'))                                
    end

    if self.type_of != Payment::TYPE_OF_EXPENSE
      self.errors.add(:type_of, _('You cannot have an add cash with type different of %s') % Payment::TYPE_OF_EXPENSE)
    end
  end



end
