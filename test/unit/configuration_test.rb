require File.dirname(__FILE__) + '/../test_helper'

class ConfigurationTest < Test::Unit::TestCase
 
  fixtures :organizations
 
  def setup
    @organization = Organization.find_by_identifier('six') 
    @configuration = Configuration.create(:is_model => true, :organization_name => 'Some Name', 
                       :product_name => 'Some name', :department_name => 'Some Name', 
                        :customer_name => 'Some name', :document_name => 'Some Name', :name => 'A name',
                        :organization_name_on_plural => 'Organizations Name', :product_name_on_plural => 'Products name', 
                        :department_name_on_plural => 'Departments Name', :customer_name_on_plural => 'Customers name', 
                        :document_name_on_plural => 'Documents Name')
  end

  def create_configuration(params = {})
    Configuration.create!(:is_model => params[:is_model] || false, :organization_name => 'some name', 
      :product_name => 'some name', :department_name => 'some name',  :customer_name => 'some name', 
      :document_name => 'some name', :organization_name_on_plural => 'Organizations Name',
      :product_name_on_plural => 'Productsname', :department_name_on_plural => 'Departments Name', 
      :customer_name_on_plural => 'Customers name', :document_name_on_plural => 'Documents Name', 
      :name => params[:name] || 'some name', :organization => params[:organization])
  end

  def test_setup
    assert @organization.valid?
    assert @configuration.valid?
  end

  DISPLAY_CONFIGURATION_CLASSES_TEST = %w[
    WorkerDisplay
    ProductDisplay
    MoneyDisplay
    CheckDisplay
    CreditCardDisplay
    DebitCardDisplay
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
    StockDevolutionDisplay
    StockDownDisplay
    StockOutDisplay
    ProfileDisplay
    UserDisplay
    PeriodicityDisplay
    DocumentDisplay
  ]

  def test_configuration_itens_array
    assert_equal 0, (DISPLAY_CONFIGURATION_CLASSES_TEST - Configuration::DISPLAY_CONFIGURATION_CLASSES).length
  end

  def test_presence_of_name_when_is_model
    c = Configuration.new(:is_model => true)  
    c.valid?
    assert c.errors.invalid?(:name)
    c.name = 'some name'
    c.valid?
    assert !c.errors.invalid?(:name)
  end

  def test_uniqueness_of_name_when_is_model
    Configuration.delete_all
    Configuration.create!(:is_model => true, :organization_name => 'some name', 
      :product_name => 'some name', :department_name => 'some name',  :customer_name => 'some name', 
      :document_name => 'some name', :name => 'some name', :organization_name_on_plural => 'Organizations Name',
      :product_name_on_plural => 'Productsname', :department_name_on_plural => 'Departments Name', 
      :customer_name_on_plural => 'Customers name', :document_name_on_plural => 'Documents Name')
    c = Configuration.new(:is_model => true, :name => 'some name')  
    c.valid?
    assert c.errors.invalid?(:name)
  end

  def test_permit_equal_names_when_is_not_model
    Configuration.create( :organization_name => 'Some Name', 
      :product_name => 'Some name', :department_name => 'Some Name',  :customer_name => 'Some name', 
      :document_name => 'Some Name', :name => 'some name')
    c = Configuration.new(:name => 'some name')  
    c.valid?
    assert !c.errors.invalid?(:name)
  end


  def test_presence_of_organization
    c = Configuration.new  
    c.valid?
    assert c.errors.invalid?(:organization_id)
    c.organization = @organization
    c.valid?
    assert !c.errors.invalid?(:organization_id)
  end

  def test_association_of_a_template
    c = Configuration.new(:is_model => true)
    c.organization = @organization
    c.valid?
    assert c.errors.invalid?(:organization_id)
    c.organization = nil
    c.valid?
    assert !c.errors.invalid?(:organization_id)
  end

  def test_presence_of_organization_name
    c = Configuration.new  
    c.valid?
    assert c.errors.invalid?(:organization_name)
    c.organization_name = 'Some name'
    c.valid?
    assert !c.errors.invalid?(:organization_name)
  end

  def test_presence_of_product_name
    c = Configuration.new  
    c.valid?
    assert c.errors.invalid?(:product_name)
    c.product_name = 'Some name'
    c.valid?
    assert !c.errors.invalid?(:product_name)
  end

  def test_presence_of_department_name
    c = Configuration.new  
    c.valid?
    assert c.errors.invalid?(:department_name)
    c.department_name = 'Some name'
    c.valid?
    assert !c.errors.invalid?(:department_name)
  end

  def test_presence_of_customer_name
    c = Configuration.new  
    c.valid?
    assert c.errors.invalid?(:customer_name)
    c.customer_name = 'Some name'
    c.valid?
    assert !c.errors.invalid?(:customer_name)
  end

  def test_presence_of_document_name
    c = Configuration.new  
    c.valid?
    assert c.errors.invalid?(:document_name)
    c.document_name = 'Some name'
    c.valid?
    assert !c.errors.invalid?(:document_name)
  end

  def test_find_configuration_models
    Configuration.delete_all
    create_configuration(:name => 'name 1', :is_model => true)
    create_configuration(:name => 'name 2', :is_model => true)
    create_configuration(:name => 'name 3', :organization => @organization)

    assert_equal 2, Configuration.models.length
  end

  def test_is_model_with_valid_id
    c = create_configuration(:name => 'name 1', :is_model => true)

    assert Configuration.is_model?(c.id)
    c.is_model=false
    c.organization = @organization
    assert c.save
    assert !Configuration.is_model?(c.id)
  end

  def test_is_model_with_invalid_id
    Configuration.delete_all
    id = 1 #invalid id
    assert !Configuration.is_model?(id)
  end


  def test_organization_name
    name = 'some name'
    @configuration.organization_name = name
    assert @configuration.save
    assert_equal name, @configuration.organization_name
  end

  def test_product_name
    name = 'some name'
    @configuration.product_name = name
    assert @configuration.save!
    assert_equal name, @configuration.product_name
  end

  def test_department_name
    name = 'some name'
    @configuration.department_name = name
    assert @configuration.save
    assert_equal name, @configuration.department_name
  end

  def test_customer_name
    name = 'some name'
    @configuration.customer_name = name
    assert @configuration.save
    assert_equal name, @configuration.customer_name
  end

  def test_document_name
    name = 'some name'
    @configuration.document_name = name
    assert @configuration.save
    assert_equal name, @configuration.document_name
  end

  def test_organization_name=
    name = 'some name'
    @configuration.organization_name = name
    assert @configuration.save
    assert_equal @configuration.settings['organization_name'], @configuration.organization_name
  end

  def test_product_name=
    name = 'some name'
    @configuration.product_name = name
    assert @configuration.save
    assert_equal @configuration.settings['product_name'], @configuration.product_name
  end

  def test_department_name=
    name = 'some name'
    @configuration.department_name = name
    assert @configuration.save
    assert_equal @configuration.settings['department_name'], @configuration.department_name
  end

  def test_customer_name=
    name = 'some name'
    @configuration.customer_name = name
    assert @configuration.save
    assert_equal @configuration.settings['customer_name'], @configuration.customer_name
  end

  def test_document_name=
    name = 'some name'
    @configuration.document_name = name
    assert @configuration.save
    assert_equal @configuration.settings['document_name'], @configuration.document_name
  end

  # Test set_display_configuration= functions to each DISPLAY_CONFIGURATION_CLASSES_TEST
  DISPLAY_CONFIGURATION_CLASSES_TEST.each do |item|
    define_method("test_set_#{item.tableize}=") do   
      item.constantize.delete_all
      params = {}
      item.constantize.available_fields.collect { |d|
        params[d] = {:field => d}
      }
      @configuration.send("set_#{item.tableize}=", params)
      assert_equal params.length, @configuration.send("#{item.tableize}").length
    end
  end



  # When we use the function set_display_configuration= with a empty param
  # the DisplayConfiguration objects must be erased
  DISPLAY_CONFIGURATION_CLASSES_TEST.each do |item|
    define_method("test_erase_set_#{item.tableize}=") do   
      item.constantize.delete_all
      params = {}
      item.constantize.available_fields.collect { |d|
        params[d] = {:field => d}
      }
      @configuration.send("set_#{item.tableize}=", params)
      assert_equal params.length, @configuration.send("#{item.tableize}").length

      params = {}
      @configuration.send("set_#{item.tableize}=", params)
      assert_equal 0, @configuration.send("#{item.tableize}").length
    end
  end

  #Test presence of field on inlist methods
  DISPLAY_CONFIGURATION_CLASSES_TEST.each do |item|
    define_method("test_inlist_#{item.tableize}") do   
      item.constantize.delete_all
      params = {}
      inlist = true
      count = 0
      item.constantize.available_fields.collect { |d|
        if inlist == true 
          params[d] = {:field => d, :display_in_list => true}
          count = count + 1
          inlist = false
        else
          params[d] = {:field => d, :display_in_list => false}
          inlist = true
        end
      }
      @configuration.send("set_#{item.tableize}=", params)

      assert_equal count, @configuration.send("inlist_#{item.tableize}").length
    end
  end

  #Test has_many associations exist
  DISPLAY_CONFIGURATION_CLASSES_TEST.each do |item|
    define_method("test_has_many_#{item.tableize}") do
      item.constantize.delete_all
      configuration_id = @configuration.id
      d = item.constantize.create(:field => item.constantize.available_fields[0], :configuration => @configuration )
      @configuration.send("#{item.tableize}=", [d])
      c = Configuration.find(configuration_id)
      assert c.send(item.tableize).include?(d)
    end
  end


end
