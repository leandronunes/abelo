class Tracker < ActiveRecord::Base

  belongs_to :organization

  serialize :specific_trackers, Hash

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
