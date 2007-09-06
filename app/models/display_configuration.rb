class DisplayConfiguration < ActiveRecord::Base

  belongs_to :configuration

  validates_presence_of :configuration_id
  validates_uniqueness_of :field #TODOPut this validation on scope of configuration and type

end
