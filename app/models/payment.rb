class Payment < ActiveRecord::Base 
  belongs_to :sale
  validates_presence_of :sale_id, :value, :date, :received
  validates_numericality_of :value
  validates_inclusion_of :value, :in => InfiniteSet::POSITIVES, :if => lambda { |p| !(p.cash.nil?) }
end
