class Configuration < ActiveRecord::Base
  belongs_to :organization

  has_many :product_displays
  has_many :worker_displays
  has_many :customer_displays
  has_many :supplier_displays
  has_many :bank_account_displays
  has_many :ledger_displays
  has_many :debit_ledger_displays
  has_many :credit_ledger_displays
  has_many :product_category_displays
  has_many :worker_category_displays
  has_many :supplier_category_displays
  has_many :customer_category_displays
  has_many :ledger_category_displays
  has_many :department_displays
  has_many :mass_mail_displays

#TODO See a way to guarantee that a configuration cannot be created whithout an organization
#  validates_presence_of :organization_id, :if => lambda { |conf| !conf.is_model?}
  
  def validate
    self.errors.add('organization_id', _('You cannot associate a template to an organization') )   if self.is_model? and !self.organization.nil?
  end

  def self.find_all_model
    Configuration.find(:all, :conditions => ['is_model = ?', true])
  end

  CONFIGURATION_ITEMS = %w[
    product
    worker
    customer
    supplier
    bank_account
    product_category
    worker_category
    customer_category
    supplier_category
    ledger_category
    department
    mass_mail
    ledger
    credit_ledger
    debit_ledger
  ]

  #######################################
  # Configuration Object Methods
  #######################################
 
  # Receives an array of permited fields in the object defined by CONFIGURATION_ITEMS
  # and create a ObjetcDisplay object to each field associated to 
  # the current configuration object.
  #
  # The ObjectDisplay object in this case is used to define wich field of the
  # ObjetcDisplay object will be display on the edit and show actions
  CONFIGURATION_ITEMS.each do |item|
    define_method("#{item}_display_fields=") do |fields|
      set_fields(eval(item.camelize), fields)
    end
  end

  # Receives an array of permited fields in the object defined by CONFIGURATION_ITEMS
  # and create a ObjectDisplay object to each field associated to the current configuration 
  # object.
  #
  # The ObjectDisplay in this case is used to define wich field of the object 
  # will be display on the list action
  #
  # The diferrence of this method and the +item_display_fields=+ is
  # that in this case the ObjectDisplay object has a +true+ value on the 
  # +display_in_list+ attribute 
  CONFIGURATION_ITEMS.each do |item|
    define_method("#{item}_display_fields_in_list=") do |fields|
      set_fields_in_list(eval(item.camelize), fields)
    end
  end

  # Return a list composed by the +field+ attribute of all objects (ObjetcDisplay) defined by
  # CONFIGURATION_ITEMS associated to the current object.
  CONFIGURATION_ITEMS.each do |item|
    define_method("#{item}_display_fields") do
      display_fields(item)
    end
  end

  # Return a list composed by the +field+ attribute of all ObjectDisplay 
  # object associated to the current Configuration, whose +display_in_list+ 
  # attribute has a true value.
  CONFIGURATION_ITEMS.each do |item|
    define_method("#{item}_display_fields_in_list") do
      display_fields_in_list(item)
    end
  end

  # Return a list of all ObjectDisplay object associated to the current Configuration.
  CONFIGURATION_ITEMS.each do |item|
    define_method("#{item}_display") do
      display(item)
    end
  end

  # Return a list of all ObjectDisplay object associated to the current object, 
  # whose +display_in_list+ attribute has a true value.
  CONFIGURATION_ITEMS.each do |item|
    define_method("#{item}_display_in_list") do
      display_in_list(item)
    end
  end

  private 

  def display(object)
    self.send("#{object}_displays")
  end

  def display_in_list(object)
    self.send("#{object}_displays").select{|p| p.display_in_list? }
  end

  def display_fields(object)
    display(object).collect{|o| o.field}
  end

  def display_fields_in_list(object)
    display_in_list(object).collect{|d| d.field}
  end

  def set_fields(class_symbol, fields)
    fields.each do |field|
      if self.send("#{class_symbol.to_s.tableize.singularize}_displays").detect{|o| o.field == field}.blank?
        display = class_symbol.configuration_class.new(:field => field)
        self.send("#{class_symbol.to_s.tableize.singularize}_displays").concat(display)
      end
    end
  end

  def set_fields_in_list(class_symbol, fields)
    fields.each do |field|
      display_field = self.send("#{class_symbol.to_s.tableize.singularize}_displays").detect{|p| p.field == field}
      
      unless display_field.nil?
        display_field.display_in_list = true 
        display_field.save
        self.send("#{class_symbol.to_s.tableize.singularize}_displays", true) #force reload of objects
      end
    end
  end


end
