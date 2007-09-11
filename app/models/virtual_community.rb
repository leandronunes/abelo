# A VirtualCommunity is like a website to be hosted in the platform. It may
# contain multiple Profile's and can be identified by several different
# domains.
class VirtualCommunity < ActiveRecord::Base

  # #################################################
  # Relationships and applied behaviour
  # #################################################

  acts_as_design

  # One VirtualCommunity can be reached by many domains
  has_many :domains, :as => :owner
  belongs_to :owner, :polymorphic => true

  # #################################################
  # Attributes
  # #################################################

  # store the VirtualCommunity settings as YAML-serialized Hash.
  serialize :settings

  # returns a Hash containing the VirtualCommunity configuration
  def settings
    self[:settings] ||= {}
  end
  
  # Returns the template used by +flexible_template+ plugin.
  def flexible_template_template
    self.settings['flexible_template_template']
  end

  # Sets the template used by +flexible_template+ plugin.
  def flexible_template_template=(value)
    self.settings['flexible_template_template'] = value
  end

  # Returns the theme used by +flexible_template+ plugin
  def flexible_template_theme
    self.settings['flexible_template_theme']
  end

  # Sets the theme used by +flexible_template+ plugin
  def flexible_template_theme=(value)
    self.settings['flexible_template_theme'] = value
  end

  # Returns the icon theme used by +flexible_template+ plugin
  def flexible_template_icon_theme
    self.settings['flexible_template_icon_theme']
  end

  # Sets the icon theme used by +flexible_template+ plugin
  def flexible_template_icon_theme=(value)
    self.settings['flexible_template_icon_theme'] = value
  end
 
  # #################################################
  # Validations
  # #################################################

  # <tt>name</tt> is mandatory
  validates_presence_of :name

end
