require File.dirname(__FILE__) + '/../test_helper'

class SupplierCategoryTest < Test::Unit::TestCase

  fixtures :organizations

  def setup
    @organization = create_organization
    @supplier_category = create_supplier_category
  end

  def test_relation_with_suppliers
    supplier = Supplier.new(:name => 'Supplier for testing', :organization => @organization, :email => 'testing@email', :cpf => '65870844274')
    @supplier_category.suppliers.concat(supplier)
    assert_equal 1, @supplier_category.suppliers.count
  end

  def test_uniqueness_field_name
    supplier_category_1 = SupplierCategory.create(:name => 'Category for testing', :organization => @organization)
    
    supplier_category_2 = SupplierCategory.create(:name => 'Category for testing', :organization => @organization)

    assert supplier_category_2.errors.invalid?(:name)
  end

end
