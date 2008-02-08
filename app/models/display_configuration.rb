class DisplayConfiguration < ActiveRecord::Base

  belongs_to :configuration

  validates_uniqueness_of :field, :scope => :configuration_id

  before_validation_on_create do |display|
    unless display.configuration.nil?
      display.position ||= (display.configuration.send(display.class.name.tableize).map(&:position).max || 0) + 1
    end
  end

  def validate
    self.errors.add(:field, _("The field %s is not a valid field") % self.field ) unless self.class.available_fields.include?(self.field)
  end

  serialize :settings

  def describe_field
    self.class.describe(self.field)
  end

  def self.title
    raise "You have to define a title class method to class "
  end

  def self.all_available?
    true
  end

  def self.inlist_available_fields
    self.available_fields
  end

  def self.break_lines
    []
  end

  def self.titles
    self.available_fields
  end

  def switch(field)
    field = field.class.find(field.id) #FIXME see a better way to the object don't came as read only
    temp_position = self.position
    self.position = field.position
    field.position = temp_position
  
    transaction do 
      field.save!
      self.save!
    end
  end

  def settings
    self[:settings] ||= {}
  end

  def display_in_list?
    settings['display_in_list'].to_s == 'true' ? true : false
  end

  def display_in_list
    settings['display_in_list'].to_s == 'true' ? _('Yes') : _('No')
  end

  def display_in_list= value
    settings['display_in_list'] = value
  end

  def break_line?
    settings['break_line'].to_s == 'true' ? true : false
  end

  def break_line
    settings['break_line'].to_s == 'true' ? _('Yes') : _('No')
  end

  def break_line= value
    settings['break_line'] = value
  end

  def display_title?
    settings['display_title'].to_s == 'true' ? true : false
  end

  def display_title
    settings['display_title'].to_s == 'true' ? _('Yes') : _('No')
  end

  def display_title= value
    settings['display_title'] = value
  end

end
