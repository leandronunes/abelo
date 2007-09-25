class Configuration < ActiveRecord::Base

  belongs_to :organization

  has_many :product_displays, :dependent => :destroy
  has_many :worker_displays, :dependent => :destroy
  has_many :customer_displays, :dependent => :destroy
  has_many :supplier_displays, :dependent => :destroy
  has_many :bank_account_displays, :dependent => :destroy
  has_many :ledger_displays, :dependent => :destroy
  has_many :product_category_displays, :dependent => :destroy
  has_many :worker_category_displays, :dependent => :destroy
  has_many :supplier_category_displays, :dependent => :destroy
  has_many :customer_category_displays, :dependent => :destroy
  has_many :ledger_category_displays, :dependent => :destroy
  has_many :department_displays, :dependent => :destroy
  has_many :mass_mail_displays, :dependent => :destroy
  has_many :stock_virtual_displays, :dependent => :destroy
  has_many :stock_in_displays, :dependent => :destroy
  has_many :stock_out_displays, :dependent => :destroy
  has_many :profile_displays, :dependent => :destroy
  has_many :user_displays, :dependent => :destroy
  has_many :periodicity_displays, :dependent => :destroy

  serialize :settings 

  validates_presence_of :organization_id, :if => lambda { |conf| !conf.is_model?}
  validates_presence_of :name, :if => lambda {|conf| conf.is_model? }
  validates_uniqueness_of :name, :if => lambda {|conf| conf.is_model? }
 
  def validate
    if self.is_model? and !self.organization.nil?
      self.errors.add('organization_id', _('You cannot associate a template to an organization') )   
    end

    if self.organization_name.blank?
      self.errors.add( 'organization_name', _('Organization name cannot be blank') )  
    end

    self.errors.add( 'product_name', _('Product name cannot be blank') )  if self.product_name.blank?

    self.errors.add( 'department_name', _('Department name cannot be blank') )  if self.department_name.blank?

    self.errors.add( 'customer_name', _('Customer name cannot be blank') )  if self.customer_name.blank?

    self.errors.add( 'document_name', _('Document name cannot be blank') )  if self.document_name.blank?
  end

  def settings
    self[:settings] ||= {}
  end

  # Get all configuration models
  def self.models
    Configuration.find(:all, :conditions => ['is_model = ?', true])
  end

  def self.is_model?(id)
    begin
      Configuration.find(id).is_model?
    rescue
      false
    end
  end

  def organization_name
    self.settings["organization_name"]
  end

  def product_name
    self.settings["product_name"]
  end

  def department_name
    self.settings["department_name"]
  end

  def customer_name
    self.settings["customer_name"]
  end

  def document_name
    self.settings["document_name"]
  end

  def organization_name=(name)
    self.settings["organization_name"] = name
  end

  def product_name=(name)
    self.settings["product_name"] = name
  end

  def department_name=(name)
    self.settings["department_name"] = name
  end

  def customer_name=(name)
    self.settings["customer_name"] = name
  end

  def document_name=(name)
    self.settings["document_name"] = name
  end


#TODO see if all of this fields are needed

  #########################################
  # Display Items Configurations
  #########################################

  # Items used to generate the methods used on display actions.
  # Display actions are action that show something to user (Ex: show, edit, list)
  # For each item on th list the system will generate the methods:
  #
  #     {item}_display_fields=
  #     {item}_display_fields_in_list
  #     {item}_display
  #     {item}_display_in_list
  #
  # These actions are describe on its definition
  DISPLAY_CONFIGURATION_CLASSES = %w[
    WorkerDisplay
    ProductDisplay
    LedgerDisplay
    SupplierDisplay
    CustomerDisplay
    BankAccountDisplay
    ProductCategoryDisplay
    WorkerCategoryDisplay
    CustomerCategoryDisplay
    SupplierCategoryDisplay
    LedgerCategoryDisplay
    DepartmentDisplay
    MassMailDisplay
    StockVirtualDisplay
    StockInDisplay
    StockOutDisplay
    ProfileDisplay
    UserDisplay
    PeriodicityDisplay
  ]

  #######################################
  # Configuration Object Methods
  #######################################
 
  # Receives a hash on format:
  #
  #  {field => { display configuration parameters of field}}
  #
  # EX:
  #   The hash bellow is passed to a DisplayConfiguration object which has
  #   +name+ and +title+ as attributes.
  #
  #   {
  #     'name' => {:field => 'name', :display_in_list => false, :break_line=> true}
  #     'title' => {:field => 'title', :display_in_list => false, :break_line=> true}
  #   }
  #
  # This method uses the hash passed as parameter to create or upgrade
  # DisplayConfiguration objects.
  #
  # Is genereted a method to each DISPLAY_CONFIGURATION_CLASSES defined above.
  # The name of the method will be 'set_ITEM_OF_DISPLAY_CONFIGURATION_CLASSES'
  DISPLAY_CONFIGURATION_CLASSES.each do |item|
    define_method("set_#{item.tableize}=") do |params|
      return self.send(item.tableize).destroy_all if params.blank?

      remove_keys = self.send(item.tableize).map{|i| i.field} - params.keys
      
      remove_keys.each{|k| self.send(item.tableize).find_by_field(k).destroy}
      conf_a=[]
      params.each do |k,v|
        d_params = {}
        d_params["field"] = k
        if v[:break_line].nil? or v[:break_line].to_s == 'false'
          d_params["break_line"] = false 
        else
          d_params["break_line"] = true
        end

        if v[:display_in_list].nil? or v[:display_in_list].to_s == 'false'
          d_params["display_in_list"] = false 
        else
          d_params["display_in_list"] = true
        end

        if v[:display_title].nil? or v[:display_title].to_s == 'false'
          d_params["display_title"] = false 
        else
          d_params["display_title"] = true
        end

        display = self.send(item.tableize).find_by_field(k)
        if display.nil?
          display = item.constantize.new(d_params) 
          conf_a.push display
          self.send("#{item.tableize}=", conf_a)
        else
          display.update_attributes(d_params)
        end
      end

    end
  end


  # Return a list of DisplayConfiguration object which has 
  # +display_in_list+ attribute true.
  #
  # Is genereted a method to each DISPLAY_CONFIGURATION_CLASSES defined above.
  # The name of the method will be 'inlist_ITEM_OF_DISPLAY_CONFIGURATION_CLASSES'
  DISPLAY_CONFIGURATION_CLASSES.each do |item|
    define_method("inlist_#{item.tableize}") do
      self.send(item.tableize).select{|i| i.display_in_list? }
    end
  end

end
