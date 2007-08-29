class Configuration < ActiveRecord::Base
  belongs_to :organization

  has_many :product_displays
  has_many :supplier_displays
  has_many :worker_displays
  has_many :ledger_displays
  has_many :product_category_displays

#TODO See a way to guarantee that a configuration cannot be created whithout an organization
#  validates_presence_of :organization_id, :if => lambda { |conf| !conf.is_model?}
  
  def validate
    self.errors.add('organization_id', _('You cannot associate a template to an organization') )   if self.is_model? and !self.organization.nil?
  end

  def self.find_all_model
    Configuration.find(:all, :conditions => ['is_model = ?', true])
  end

  #######################################
  # Configuration Product Methods
  #######################################
 
  # Receives an array of permited fields of product object
  # and create a ProductDisplay object to each field associated to 
  # the current configuration object.
  #
  # The ProductDisplay object in this case is used to define wich field of the
  # product object will be display on the edit and show actions
  def product_display_fields= fields
    set_fields(Product, fields)
  end

  # Receives an array of permited fields of product object
  # and create a ProductDisplay object to each field associated to 
  # the current configuration object.
  #
  # The ProductDisplay in this case object is used to define wich field of the
  # product object will be display on the list action
  #
  # The diferrence of this method and the +product_display_fields=+ if
  # that in this case the ProductDisplay object has a +true+ value on the 
  # +display_in_list+ attribute 
  def product_display_fields_in_list= fields
    set_fields_in_list(Product, fields)
  end

  # Return a list composed by the +field+ attribute of all ProductDisplay 
  # object associated to the current object.
  def product_display_fields
    display_fields('product')
  end

  # Return a list composed by the +field+ attribute of all ProductDisplay 
  # object associated to the current object, whose +display_in_list+ 
  # attribute has a true value.
  def product_display_fields_in_list
    display_fields_in_list('product')
  end

  # Return a list of all ProductDisplay object associated to the current object.
  def product_display
    display('product')
  end

  # Return a list of all ProductDisplay object associated to the current object, 
  # whose +display_in_list+ attribute has a true value.
  def product_display_in_list
    display_in_list('product')
  end

  #######################################
  # Configuration Supplier Methods
  #######################################
  
  def supplier_display_fields= fields
    set_fields(Supplier, fields)
  end

  def supplier_display_fields_in_list= fields
    set_fields_in_list(Supplier, fields)
  end


  def supplier_display_fields
    display_fields('supplier')
  end

  def supplier_display_fields_in_list
    display_fields_in_list('supplier')
  end

  def supplier_display
    display('supplier')
  end

  def supplier_display_in_list
    display_in_list('supplier')
  end

  #######################################
  # Configuration Worker Methods
  #######################################
  
  def worker_display_fields= fields
    set_fields(Worker, fields)
  end

  def worker_display_fields_in_list= fields
    set_fields_in_list(Worker, fields)
  end

  def worker_display_fields
    display_fields('worker')
  end

  def worker_display_fields_in_list
    display_fields_in_list('worker')
  end

  def worker_display
    display('worker')
  end

  def worker_display_in_list
    display_in_list('worker')
  end

  #######################################
  # Configuration Product Category Methods
  #######################################

  def product_category_display_fields= fields
    set_fields(ProductCategory, fields)
  end

  def product_category_display_fields_in_list= fields
    set_fields_in_list(ProductCategory, fields)
  end

  def product_category_display_fields
    display_fields('product_category')
  end

  def product_category_display_fields_in_list
    display_fields_in_list('product_category')
  end

  def product_category_display
    display('product_category')
  end

  def product_category_display_in_list
    display_in_list('product_category')
  end

  #######################################
  # Configuration Ledger Methods
  #######################################
  
  def ledger_display_fields= fields
    set_fields(Ledger, fields)
  end

  def ledger_display_fields_in_list= fields
    set_fields_in_list(Ledger, fields)
  end

  def ledger_display_fields
    display_fields('ledger')
  end

  def ledger_display_fields_in_list
    display_fields_in_list('ledger')
  end

  def ledger_display
    display('ledger')
  end

  def ledger_display_in_list
    display_in_list('ledger')
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
      if self.send("#{class_symbol.to_s.tableize.singularize}_displays").select{|o| o.field == field}.empty?
        class_symbol.configuration_class.create(:field => field, :configuration => self)
      end
    end
  end

  def set_fields_in_list(class_symbol, fields)
    fields.each do |field|
      display_field = self.send("#{class_symbol.to_s.tableize.singularize}_displays").detect{|p| p.field == field}

      unless display_field.nil?
        display_field.display_in_list = true 
        display_field.save
      end
    end
  end


end
