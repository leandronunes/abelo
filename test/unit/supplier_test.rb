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

  def test_cnpj_uniq
    count = Supplier.count
    s1 = Supplier.new(:name => 'Testing unique CNPJ (first)', :organization_id => 1)
    s1.cnpj = '22071350000181'
    assert s1.save
    assert_equal count + 1, Supplier.count

    # the same organization cannot have the same supplier registered twice
    count = Supplier.count
    s2 = Supplier.new(:name => 'Testing unique CNPJ (second)', :organization_id => 1)
    s2.cnpj = '22071350000181'
    assert !s2.save
    assert_equal count, Supplier.count

    # another organization can have the same supplier registered
    count = Supplier.count
    s3 = Supplier.new(:name => 'Testing unique CNPJ (another organization)', :organization_id => 2)
    s3.cnpj = '22071350000181'
    assert s3.save
    assert_equal count + 1, Supplier.count
  end

  def test_cpf_uniq
  end

end
