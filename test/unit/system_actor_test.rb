require File.dirname(__FILE__) + '/../test_helper'

class SystemActorTest < Test::Unit::TestCase
  fixtures :system_actors

  def setup
    @organization = Organization.find(1)
    @system_actor = SystemActor.new(:name => 'A customer for testing CNPJ format', :email => 'teste@teste', :organization_id => 1, :category_id => 1, :cpf => '23831442312')
  end

  def test_setup
    assert @organization.valid?
    assert @system_actor.valid?
  end

  def test_mandatory_fields
    count = Customer.count

    c = Customer.new
    assert(!c.save)

    c.name = 'A test customer'
    assert(!c.save)

    c.email = 'teste@teste.com'
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

  def test_cpf_format
    c = SystemActor.new
    c.cpf = '00000000000' #invalid cpf
    !c.valid?
    assert c.errors.invalid?(:cpf)
   
    c.cpf = '058.131.361-50' #valid cpf
    c.valid?
    assert !c.errors.invalid?(:cpf)
  end

  def test_cnpj_or_cpf

    c = SystemActor.new
    c.cpf = '058.131.361-50' #valid cpf
    c.valid?
    assert !c.errors.invalid?(:cpf)
    assert !c.errors.invalid?(:cnpj)

    c.cnpj = '01.288.368/0001-60' #valid cnpj
    c.valid?
    assert c.errors.invalid?(:cnpj)

    c.cpf = nil 
    c.valid?
    assert !c.errors.invalid?(:cpf)
    assert !c.errors.invalid?(:cnpj)
    
    c.cnpj = nil
    c.valid?
    assert c.errors.invalid?(:cnpj)
  end

  def test_cnpj_uniq
    count = Customer.count
    c1 = Customer.new(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization_id => 1)
    c1.cnpj = '22071350000181'
    assert c1.save
    assert_equal count + 1, Customer.count

    # the same organization cannot have the same supplier registered twice
    count = Customer.count
    c2 = Customer.new(:name => 'Testing unique CNPJ (second)', :email => 'teste3@teste', :organization_id => 1)
    c2.cnpj = '22071350000181'
    assert !c2.save
    assert_equal count, Customer.count

    # another organization can have the same supplier registered
    count = Customer.count
    c3 = Customer.new(:name => 'Testing unique CNPJ (another organization)', :email => 'te@sdef', :organization_id => 2)
    c3.cnpj = '22071350000181'
    assert c3.save
    assert_equal count + 1, Customer.count
  end

  def test_cpf_uniq
    count = Customer.count
    c1 = Customer.new(:name => 'Testing unique CPF (first)', :email => 'sjh@kjh', :organization_id => 1)
    c1.cpf = '18385961437'
    assert c1.save
    assert_equal count + 1, Customer.count

    # the same organization cannot have the same supplier registered twice
    count = Customer.count
    c2 = Customer.new(:name => 'Testing unique CPF (second)', :email => 'dsf@kdfv', :organization_id => 1)
    c2.cpf = '18385961437'
    assert !c2.save
    assert_equal count, Customer.count

    # another organization can have the same supplier registered
    count = Customer.count
    c3 = Customer.new(:name => 'Testing unique CPF (another organization)', :email => 'jdgcg@kjhk', :organization_id => 2)
    c3.cpf = '18385961437'
    assert c3.save
    assert_equal count + 1, Customer.count
  end

end
