require File.dirname(__FILE__) + '/../test_helper'

class CustomerTest < Test::Unit::TestCase
  
  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_ralation_with_category
    cat = CustomerCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    customer = Customer.new(:name => 'Customer for testing', :organization_id => @org.id, :email => 'testing@email', :cpf => '65870844274', :category_id => cat.id)
    assert_equal cat, customer.category 
  end

  def test_search
    ## What this method have to do? ##
  end

end
