class Configuration < ActiveRecord::Base
  belongs_to :organization

  serialize :full_product, Array
  serialize :lite_product, Array
  serialize :full_department, Array
  serialize :lite_department, Array
  serialize :full_customer, Array
  serialize :lite_customer, Array

  def validate
    self.errors.add('organization_id', _('You cannot associate a template to an organization') )   if self.is_model? and !self.organization.nil?
  end

  def full_product
    self[:full_product] ||= Array.new
  end
 
  def lite_product
    self[:lite_product] ||= Array.new
  end

  def full_customer
    self[:full_customer] ||= Array.new
  end
 
  def lite_customer
    self[:lite_customer] ||= Array.new
  end


  def self.find_all_model
    Configuration.find(:all, :conditions => ['is_model = ?', true])
  end

  def full_bank_account
    ["owner", "bank", "agency", "variation", "account"]
  end

  def lite_bank_account
    ["owner", "bank", "agency", "variation", "account"]
  end

  def full_department
    ['name']
  end

  def lite_department
    ['name']
  end

  def full_ledger
   Ledger.column_names + ['date', 'value', 'schedule_repeat', 'schedule_periodicity', 'schedule_interval']
  end

end
