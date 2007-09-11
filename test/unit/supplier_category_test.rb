require File.dirname(__FILE__) + '/../test_helper'

class SupplierCategoryTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
  end

  def test_relation_with_suppliers
    supp_cat = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    supplier = Supplier.new(:name => 'Supplier for testing', :organization_id => @org.id, :email => 'testing@email', :cpf => '65870844274')
    supp_cat.suppliers.concat(supplier)
    assert_equal 1, supp_cat.suppliers.count
  end

  def test_uniqueness_field_name
    supp_cat_1 = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    
    supp_cat_2 = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)

    assert supp_cat_2.errors.invalid?(:name)
  end

end
