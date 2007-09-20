class DisplayConfiguration < ActiveRecord::Base

  belongs_to :configuration

  validates_presence_of :configuration_id
  validates_uniqueness_of :field, :scope => :configuration_id

  def describe_field
    self.class.describe(self.field)
  end

  def self.title
    raise "You have to define a title class method to class "
  end

end
