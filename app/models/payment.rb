class Payment < ActiveRecord::Base
  validates_presence_of :sale_id, :value, :date, :received
  validates_numericality_of :value
  validates_inclusion_of :value, :in => InfiniteSet::POSITIVES, :if => lambda { |p| !(p.cash.nil?) }
  
  belongs_to :sale

end
