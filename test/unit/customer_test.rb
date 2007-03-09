require File.dirname(__FILE__) + '/../test_helper'

class CustomerTest < Test::Unit::TestCase
  fixtures :customers
  fixtures :organizations

  # Replace this with your real tests.
  def setup
    @organization = Organization.find(1)
  end

  def test_mandatory_fields
    count = Customer.count

    c = Customer.new
    assert(!c.save)

    c.name = 'A test customer'
    assert(!c.save)

    c.birthday = '1982-03-10'
    assert(!c.save)

    c.address = 'A test address'
    assert(!c.save)

    c.cnpj = '47635123000162'
    assert(!c.save)

    c.organization_id = 1
    assert(c.save)

    assert_equal count + 1, Customer.count
  end

  def test_cnpj_format
    count = Customer.count
    c = Customer.new(:name => 'A customer for testing CNPJ format', :organization_id => 1)
    c.cnpj = '00000000000000'
    assert !c.save
   
    c.cnpj = '85978357000100'
    assert c.save
    
    assert_equal count + 1, Customer.count
  end

  def test_cnpj_or_cpf

    c = Customer.find(1)
    c.cpf = '27774667857'
    assert !c.save
    c.cnpj = nil
    assert c.save

    s = Customer.find(3)
    s.cnpj = '28695988000170'
    assert !s.save
    s.cnpj = nil
    assert s.save
  end

  def test_cnpj_uniq
    count = Customer.count
    c1 = Customer.new(:name => 'Testing unique CNPJ (first)', :organization_id => 1)
    c1.cnpj = '22071350000181'
    assert c1.save
    assert_equal count + 1, Customer.count

    # the same organization cannot have the same supplier registered twice
    count = Customer.count
    c2 = Customer.new(:name => 'Testing unique CNPJ (second)', :organization_id => 1)
    c2.cnpj = '22071350000181'
    assert !c2.save
    assert_equal count, Customer.count

    # another organization can have the same supplier registered
    count = Customer.count
    c3 = Customer.new(:name => 'Testing unique CNPJ (another organization)', :organization_id => 2)
    c3.cnpj = '22071350000181'
    assert c3.save
    assert_equal count + 1, Customer.count
  end

  def test_cpf_uniq
    count = Customer.count
    c1 = Customer.new(:name => 'Testing unique CPF (first)', :organization_id => 1)
    c1.cpf = '18385961437'
    assert c1.save
    assert_equal count + 1, Customer.count

    # the same organization cannot have the same supplier registered twice
    count = Customer.count
    c2 = Customer.new(:name => 'Testing unique CPF (second)', :organization_id => 1)
    c2.cpf = '18385961437'
    assert !c2.save
    assert_equal count, Customer.count

    # another organization can have the same supplier registered
    count = Customer.count
    c3 = Customer.new(:name => 'Testing unique CPF (another organization)', :organization_id => 2)
    c3.cpf = '18385961437'
    assert c3.save
    assert_equal count + 1, Customer.count
  end

end
