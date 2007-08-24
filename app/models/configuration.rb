class Configuration < ActiveRecord::Base
  belongs_to :organization

  serialize :full_product, Array
  serialize :lite_product, Array
  serialize :full_department, Array
  serialize :lite_department, Array
  serialize :full_customer, Array
  serialize :lite_customer, Array
  serialize :full_worker, Array
  serialize :lite_worker, Array
  serialize :full_supplier, Array
  serialize :lite_supplier, Array
  serialize :full_category, Array
  serialize :lite_category, Array

#TODO See a way to guarantee that a configuration cannot be created whithout an organization
#  validates_presence_of :organization_id, :if => lambda { |conf| !conf.is_model?}
  
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

  def full_worker
    self[:full_worker] ||= Array.new
  end
 
  def lite_worker
    self[:lite_worker] ||= Array.new
  end

  def full_supplier
    self[:full_supplier] ||= Array.new
  end
 
  def lite_supplier
    self[:lite_supplier] ||= Array.new
  end

  def full_category
    self[:full_category] ||= Array.new
  end
 
  def lite_category
    self[:lite_category] ||= Array.new
  end

  alias :lite_product_category :lite_category
  alias :lite_customer_category :lite_category
  alias :lite_worker_category :lite_category
  alias :lite_supplier_category :lite_category

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
