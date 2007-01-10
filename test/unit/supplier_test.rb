require File.dirname(__FILE__) + '/../test_helper'

class SupplierTest < Test::Unit::TestCase
  fixtures :suppliers

  # Replace this with your real tests.
  def test_mandatory_fields

    count = Supplier.count

    s = Supplier.new
    assert !s.save

    s.name = 'A test supplier'
    assert !s.save

    s.cnpj = '47635123000162'
    assert !s.save

    s.organization_id = 1
    assert s.save

    assert_equal count + 1, Supplier.count

  end

  def test_cnpj_format
    count = Supplier.count
    s = Supplier.new(:name => 'A supplier for testing CNPJ format', :organization_id => 1)
    s.cnpj = '00000000000000'
    assert !s.save
    s.cnpj = '85978357000100'
    assert s.save
    assert_equal count + 1, Supplier.count
  end

  def test_products
    s = Supplier.find(1)
    assert_not_nil s.products
    assert_equal Array, s.products.class
    s.products.each { |p|
      assert_equal Product, p.class
    }
  end

  def test_cnpj_or_cpf

    s = Supplier.find(1)
    s.cpf = '27774667857'
    assert !s.save
    s.cnpj = nil
    assert s.save

    s = Supplier.find(3)
    s.cnpj = '28695988000170'
    assert !s.save
    s.cnpj = nil
    assert s.save

  end

end
