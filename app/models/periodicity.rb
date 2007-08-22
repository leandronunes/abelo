class Periodicity < ActiveRecord::Base
  belongs_to :organization

  validates_presence_of :organization_id
  validates_presence_of :number_of_days
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id


end
