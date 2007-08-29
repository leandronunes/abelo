class DisplayConfiguration < ActiveRecord::Base

  belongs_to :configuration

  validates_presence_of :configuration_id
  validates_uniqueness_of :field #TODOPut this validation on scope of configuration and type

  def self.title_name
    _('Name')
  end

  def self.title_category
    _('Category')
  end

end
