class Configuration < ActiveRecord::Base
  belongs_to :organization

  serialize :full_product, Array
  serialize :lite_product, Array
  #, Array TODO fix this problem
  #The serialize must be an array but if the value is nil
  #It craches
  #

  def validate
    self.errors.add('organization_id', _('You cannot associate a template to an organization') )   if self.is_model? and !self.organization.nil?
  end

  def full_product
    self[:full_product] ||= Array.new
  end
 
  def lite_product
    self[:lite_product] ||= Array.new
  end

  def self.find_all_model
    Configuration.find(:all, :conditions => ['is_model = ?', true])
  end


end
