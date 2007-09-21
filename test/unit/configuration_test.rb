require File.dirname(__FILE__) + '/../test_helper'

class ConfigurationTest < Test::Unit::TestCase
 
  def setup
    @organization = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
    @configuration = Configuration.create(:is_model => true, :organization_name => 'Some Name', 
                       :product_name => 'Some name', :department_name => 'Some Name', 
                        :customer_name => 'Some name', :document_name => 'Some Name', :name => 'A name')
  end

  def test_setup
    assert @organization.valid?
    assert @configuration.valid?
  end

  DISPLAY_CONFIGURATION_CLASSES_TEST = %w[
    WorkerDisplay
    ProductDisplay
    CustomerDisplay
    SupplierDisplay
    BankAccountDisplay
    ProductCategoryDisplay
    WorkerCategoryDisplay
    CustomerCategoryDisplay
    SupplierCategoryDisplay
    LedgerCategoryDisplay
    DepartmentDisplay
    MassMailDisplay
    LedgerDisplay
    CreditLedgerDisplay
    DebitLedgerDisplay
    StockInDisplay
    StockOutDisplay
    ProfileDisplay
    UserDisplay
  ]


  def test_configuration_itens_array
    Configuration::DISPLAY_CONFIGURATION_CLASSES.each do |item|
      assert DISPLAY_CONFIGURATION_CLASSES_TEST.include?(item)
    end
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
    Configuration.create(:is_model => true, :organization_name => 'Some Name', 
      :product_name => 'Some name', :department_name => 'Some Name',  :customer_name => 'Some name', 
      :document_name => 'Some Name', :name => 'some name')
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
    Configuration.create(:is_model => true, :organization_name => 'Some Name', 
                         :product_name => 'Some name', :department_name => 'Some Name', 
                          :customer_name => 'Some name', :document_name => 'Some Name', 
                          :name => 'name 1')
    Configuration.create(:is_model => true, :organization_name => 'Some Name', 
                         :product_name => 'Some name', :department_name => 'Some Name', 
                          :customer_name => 'Some name', :document_name => 'Some Name',
                          :name => 'name 2')
    Configuration.create(:is_model => false, :organization_name => 'Some Name', 
                         :product_name => 'Some name', :department_name => 'Some Name', 
                          :customer_name => 'Some name', :document_name => 'Some Name',
                          :name => 'name 3')
    assert_equal 2, Configuration.models.length
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
    assert @configuration.save
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


  DISPLAY_CONFIGURATION_CLASSES_TEST.each do |item|
    define_method("test_inlist_#{item.tableize}") do   
      item.constantize.delete_all
      params = {}
      inlist = true
      item.constantize.available_fields.collect { |d|
        if inlist == true 
          params[d] = {:field => d, :display_in_list => inlist}
        else
          params[d] = {:field => d}
        end
        inlist = false
      }
      @configuration.send("set_#{item.tableize}=", params)
      assert_equal 1, @configuration.send("inlist_#{item.tableize}").length
    end
  end


end
