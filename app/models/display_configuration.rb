class DisplayConfiguration < ActiveRecord::Base

  belongs_to :configuration

#  validates_presence_of :configuration_id
  validates_uniqueness_of :field, :scope => :configuration_id

  serialize :settings

  def describe_field
    self.class.describe(self.field)
  end

  def self.title
    raise "You have to define a title class method to class "
  end

  def settings
    self[:settings] ||= {}
  end

  def display_in_list?
    settings['display_in_list'] == true ? true : false
  end

  def display_in_list
    settings['display_in_list'] == true ? _('Yes') : _('No')
  end

  def display_in_list= value
    settings['display_in_list'] = value
  end

  def break_line?
    settings['break_line'] == true ? true : false
  end

  def break_line
    settings['break_line'] == true ? _('Yes') : _('No')
  end

  def break_line= value
    settings['break_line'] = value
  end

  def display_title?
    settings['display_title'] == true ? true : false
  end

  def display_title
    settings['display_title'] == true ? _('Yes') : _('No')
  end

  def display_title= value
    settings['display_title'] = value
  end

end
