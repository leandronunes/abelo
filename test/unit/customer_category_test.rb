require File.dirname(__FILE__) + '/../test_helper'

class CustomerCategoryTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
  end

  def test_relation_with_customers
    cust_cat = CustomerCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    customer = Customer.new(:name => 'Customer for testing', :organization_id => @org.id, :email => 'testing@email', :cpf => '65870844274')
    cust_cat.customers.concat(customer)
    assert_equal 1, cust_cat.customers.count
  end

  def test_uniqueness_field_name
    cust_cat_1 = CustomerCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    
    cust_cat_2 = CustomerCategory.create(:name => 'Category for testing', :organization_id => @org.id)

    assert cust_cat_2.errors.invalid?(:name)
  end

end
