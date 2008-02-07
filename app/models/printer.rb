class Printer < ActiveRecord::Base

  belongs_to :organization

  validates_presence_of :organization_id
  validates_presence_of :serial
  validates_presence_of :computer_id

end
