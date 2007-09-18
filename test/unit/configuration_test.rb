require File.dirname(__FILE__) + '/../test_helper'

class ConfigurationTest < Test::Unit::TestCase
 
  def setup
    @organization = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
  end

  def test_setup
    assert @organization.valid?
  end

  CONFIGURATION_ITEMS_TEST = %w[
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
    stock_in
    stock_out
    profile
    user
  ]

  def test_find_configuration_models
    Configuration.delete_all
    Configuration.create(:is_model => true, :organization_name => 'Some Name', 
                         :product_name => 'Some name', :department_name => 'Some Name', 
                          :customer_name => 'Some name', :document_name => 'Some Name')
    Configuration.create(:is_model => true, :organization_name => 'Some Name', 
                         :product_name => 'Some name', :department_name => 'Some Name', 
                          :customer_name => 'Some name', :document_name => 'Some Name')
    Configuration.create(:is_model => false, :organization_name => 'Some Name', 
                         :product_name => 'Some name', :department_name => 'Some Name', 
                          :customer_name => 'Some name', :document_name => 'Some Name')
    assert_equal 2, Configuration.models.length
  end

  def test_configuration_itens_array
    Configuration::CONFIGURATION_ITEMS.each do |item|
      assert CONFIGURATION_ITEMS_TEST.include?(item)
    end
  end

  CONFIGURATION_ITEMS_TEST.each do |item|
    define_method("test_#{item}_display_fields=") do    
      eval("#{item.camelize}Display").delete_all
      configuration = @organization.configuration 
      configuration.send("#{item}_display_fields=", ["name"])
      assert_equal ["name"], configuration.send("#{item}_display_fields")
    end
  end

  CONFIGURATION_ITEMS_TEST.each do |item|
    define_method("test_#{item}_display_fields_in_list=") do   
      eval("#{item.camelize}Display").delete_all
      configuration = @organization.configuration 
      configuration.send("#{item}_display_fields=", ["name"])
      configuration.send("#{item}_display_fields_in_list=", ["name"])
      assert_equal ["name"], configuration.send("#{item}_display_fields_in_list")
    end
  end

  CONFIGURATION_ITEMS_TEST.each do |item|
    define_method("test_#{item}_display_fields") do   
      eval("#{item.camelize}Display").delete_all
      configuration = @organization.configuration 
      configuration.send("#{item}_display_fields=", ["name"])
      configuration.send("#{item}_display_fields_in_list=", ["name"])
      assert_equal ["name"], configuration.send("#{item}_display_fields")
    end
  end

  CONFIGURATION_ITEMS_TEST.each do |item|
    define_method("test_#{item}_display_fields_in_list") do   
      eval("#{item.camelize}Display").delete_all
      configuration = @organization.configuration 
      configuration.send("#{item}_display_fields=", ["name"])
      configuration.send("#{item}_display_fields_in_list=", ["name"])
      assert_equal ["name"], configuration.send("#{item}_display_fields_in_list")
    end
  end

  CONFIGURATION_ITEMS_TEST.each do |item|
    define_method("test_#{item}_display") do   
      eval("#{item.camelize}Display").delete_all
      configuration = @organization.configuration 
      configuration.send("#{item}_display", ["name"])
      assert_equal configuration.send("#{item}_displays"), configuration.send("#{item}_display")
    end
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

end
