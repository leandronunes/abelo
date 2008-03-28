require File.dirname(__FILE__) + '/../test_helper'

class CustomerCategoryTest < Test::Unit::TestCase

  fixtures :organizations

  def setup
    @organization = create_organization
    @customer_category = create_customer_category
  end

  def test_relation_with_customers
    customer = Customer.new(:name => 'Customer for testing', :organization => @organization, :email => 'testing@email', :cpf => '65870844274')
    @customer_category.customers.concat(customer)
    assert_equal 1, @customer_category.customers.count
  end

  def test_uniqueness_field_name
    customer_category_1 = CustomerCategory.create(:name => 'Category for testing', :organization => @organization)
    
    customer_category_2 = CustomerCategory.create(:name => 'Category for testing', :organization => @organization)

    assert customer_category_2.errors.invalid?(:name)
  end

end
