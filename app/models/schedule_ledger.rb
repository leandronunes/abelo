class ScheduleLedger < ActiveRecord::Base
  belongs_to :periodicity
  has_many :ledgers

  validates_presence_of :periodicity_id
  validates_presence_of :start_date
  validates_presence_of :interval

  validates_numericality_of :interval, :only_interger => true
#FIXME remove this
#  before_destroy do |schedule|
#    Ledger.destroy_all(:status => Status::STATUS_PENDING, :schedule_ledger_id => schedule)
#  end

  def pending_ledgers
    Ledger.find(:all, :conditions => {:status => Status::STATUS_PENDING, :schedule_ledger_id => self})
  end

  def validate
    if !self.start_date.nil? and (self.start_date.kind_of?(Time) ? self.start_date.to_datetime : self.start_date) <= (DateTime.now-1)
      errors.add('start_date', I18n.t(:you_cannot_schedule_a_ledger_starting_in_a_time_on_the_past)) 
    end
  end


end
