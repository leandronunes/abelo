class Tracker < ActiveRecord::Base

  belongs_to :organization

  validates_numericality_of :available_points, :only_integer => true, :allow_nil => true

  serialize :specific_trackers, Hash

  def validate
    if !self.specific_trackers[:user].blank? and !self.specific_trackers[:user].is_a? Integer
      self.errors.add('user', _('You have to add a numerical value'))
    end

    if !self.specific_trackers[:web_site].blank? and !self.specific_trackers[:web_site].is_a? Integer
      self.errors.add('web_site', _('You have to add a numerical value'))
    end

  end

  def specific_trackers
    self[:specific_trackers] ||= {}
  end

  def user
    self.specific_trackers[:user] || 0
  end

  def user=(value)
    self.specific_trackers[:user] = value
  end

  def web_site
    self.specific_trackers[:web_site] || 0
  end

  def web_site=(value)
    self.specific_trackers[:web_site] = value
  end

  def self.describe(field)
    {
      'user' =>  _('User total points'),
      'web_site' => _('Web site total points'),
    }[field] || field
  end

end
