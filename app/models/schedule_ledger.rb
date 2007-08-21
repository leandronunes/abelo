class ScheduleLedger < ActiveRecord::Base
  belongs_to :periodicity

  validates_presence_of :periodicity_id
  validates_presence_of :start_date
  validates_presence_of :interval

  validates_numericality_of :interval, :only_interger => true

  def validate
    if self.start_date < Date.today
      errors.add('start_date', _('You cannot schedule a ledger starting in a time on the past')) 
    end
  end


end
