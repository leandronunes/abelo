require File.dirname(__FILE__) + '/../test_helper'

class ConfigurationTest < Test::Unit::TestCase
 
  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
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
  ]

  def test_find_all_model
    Configuration.delete_all
    Configuration.create(:is_model => true)
    Configuration.create(:is_model => true)
    Configuration.create(:is_model => false)
    assert_equal 2, Configuration.find_all_model.length
  end

  def test_configuration_itens_array
    Configuration::CONFIGURATION_ITEMS.each do |item|
      assert CONFIGURATION_ITEMS_TEST.include?(item)
    end
  end

  def test_relation_with_product_category_displays
    configuration = @org.configuration
    id = configuration.id
    configuration = Configuration.find(id)
    prod_cat = ProductCategoryDisplay.new
    prod_cat.configuration = configuration
    assert prod_cat.save
    assert configuration.product_category_displays.include?(prod_cat)
  end

  CONFIGURATION_ITEMS_TEST.each do |item|
    define_method("test_#{item}_display_fields=") do    
      eval("#{item.camelize}Display").delete_all
      configuration = @org.configuration 
      configuration.send("#{item}_display_fields=", ["name"])
      assert_equal ["name"], configuration.send("#{item}_display_fields")
    end
  end

  CONFIGURATION_ITEMS_TEST.each do |item|
    define_method("test_#{item}_display_fields_in_list=") do   
      eval("#{item.camelize}Display").delete_all
      configuration = @org.configuration 
      configuration.send("#{item}_display_fields=", ["name"])
      configuration.send("#{item}_display_fields_in_list=", ["name"])
      assert_equal ["name"], configuration.send("#{item}_display_fields_in_list")
    end
  end

  CONFIGURATION_ITEMS_TEST.each do |item|
    define_method("test_#{item}_display_fields") do   
      eval("#{item.camelize}Display").delete_all
      configuration = @org.configuration 
      configuration.send("#{item}_display_fields=", ["name"])
      configuration.send("#{item}_display_fields_in_list=", ["name"])
      assert_equal ["name"], configuration.send("#{item}_display_fields")
    end
  end

  CONFIGURATION_ITEMS_TEST.each do |item|
    define_method("test_#{item}_display_fields_in_list") do   
      eval("#{item.camelize}Display").delete_all
      configuration = @org.configuration 
      configuration.send("#{item}_display_fields=", ["name"])
      configuration.send("#{item}_display_fields_in_list=", ["name"])
      assert_equal ["name"], configuration.send("#{item}_display_fields_in_list")
    end
  end

  CONFIGURATION_ITEMS_TEST.each do |item|
    define_method("test_#{item}_display") do   
      eval("#{item.camelize}Display").delete_all
      configuration = @org.configuration 
      configuration.send("#{item}_display", ["name"])
      assert_equal configuration.send("#{item}_displays"), configuration.send("#{item}_display")
    end
  end

  def test_relation_with_customer_category_displays
    configuration = @org.configuration
    id = configuration.id
    configuration = Configuration.find(id)
    cust_cat = CustomerCategoryDisplay.new
    cust_cat.configuration = configuration
    assert cust_cat.save
    assert configuration.customer_category_displays.include?(cust_cat)
  end

  def test_relation_with_supplier_category_displays
    configuration = @org.configuration
    id = configuration.id
    configuration = Configuration.find(id)
    supp_cat = SupplierCategoryDisplay.new
    supp_cat.configuration = configuration
    assert supp_cat.save
    assert configuration.supplier_category_displays.include?(supp_cat)
  end

  def test_relation_with_worker_category_displays
    configuration = @org.configuration
    id = configuration.id
    configuration = Configuration.find(id)
    worker_cat = WorkerCategoryDisplay.new
    worker_cat.configuration = configuration
    assert worker_cat.save
    assert configuration.worker_category_displays.include?(worker_cat)
  end

  #test for mass mail configurantion
  def test_relation_with_mass_mail_displays
    configuration = @org.configuration
    id = configuration.id
    configuration = Configuration.find(id)
    mass_mail = MassMailDisplay.new
    mass_mail.configuration = configuration
    assert mass_mail.save
    assert configuration.mass_mail_displays.include?(mass_mail)
  end

end
