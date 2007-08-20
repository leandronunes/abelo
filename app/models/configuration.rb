class Configuration < ActiveRecord::Base
  belongs_to :organization

  serialize :full_product, Array
  serialize :lite_product, Array
  serialize :full_department, Array
  serialize :lite_department, Array

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

  def full_bank_account
    BankAccount.column_names
  end

  def lite_bank_account
    BankAccount.column_names
  end

  def full_department
    ['name']
  end

  def lite_department
    ['name']
  end

end
