require File.dirname(__FILE__) + '/../test_helper'

class SystemActorTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
    @cat = CustomerCategory.create(:name => 'Category for testing', :organization_id => @org.id)
  end

  def test_relation_with_organization
    system_actor= SystemActor.new
    system_actor.organization = @org
    assert_equal @org, system_actor.organization
  end

  def test_relation_with_contact
    system_actor= SystemActor.new
    contact = Contact.new
    system_actor.contacts.concat(contact)
    assert system_actor.contacts.include?(contact)
  end

  def test_mandatory_field_name
    system_actor = Customer.create(:email => 'teste@teste', :organization_id => 1, :category_id => @cat.id, :cpf => '23831442312')
    assert system_actor.errors.invalid?(:name)
  end

  def test_mandatory_field_organization_id
    system_actor = Customer.create(:name => 'new customer', :email => 'teste@teste', :category_id => @cat.id, :cpf => '23831442312')
    assert system_actor.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_category_id
    system_actor = Customer.create(:name => 'new customer', :email => 'teste@teste', :organization_id => 1, :cpf => '23831442312')
    assert system_actor.errors.invalid?(:category_id)
  end

  def test_mandatory_field_email
    system_actor = Customer.create(:name => 'new customer', :organization_id => 1, :category_id => @cat.id, :cpf => '23831442312')
    assert system_actor.errors.invalid?(:email)
  end

  def test_cnpj_valid_format
    system_actor = Customer.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @cat.id, :cnpj => '27122113000116')
    assert system_actor.errors.empty?
  end

  def test_cnpj_invalid_format
    system_actor = Customer.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @cat.id, :cnpj => '00000000000000')
    assert system_actor.errors.invalid?(:cnpj)
  end

  def test_cpf_valid_format
    system_actor = Customer.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @cat.id, :cpf => '86666532724')
    assert system_actor.errors.empty?
  end

  def test_cpf_invalid_format
    system_actor = Customer.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @cat.id, :cpf => '00000000000')
    assert system_actor.errors.invalid?(:cpf)
  end

  def test_cnpj_uniq
    c1 = Customer.create(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization_id => 1, :cnpj => '22071350000181', :category_id => @cat.id)

    # the same organization cannot have the same supplier registered twice
    c2 = Customer.create(:name => 'Testing unique CNPJ (second)', :email => 'teste3@teste', :organization_id => 1, :cnpj => '22071350000181', :category_id => @cat.id)
    assert c2.errors.invalid?(:cnpj)

    # another organization can have the same supplier registered
    c3 = Customer.new(:name => 'Testing unique CNPJ (another organization)', :email => 'te@sdef', :organization_id => 2, :cnpj => '22071350000181')
    assert c3.errors.empty?
  end

  def test_cpf_uniq
    c1 = Customer.create(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization_id => 1, :cpf => '86666532724', :category_id => @cat.id)

    # the same organization cannot have the same supplier registered twice
    c2 = Customer.create(:name => 'Testing unique CNPJ (second)', :email => 'teste3@teste', :organization_id => 1, :cpf => '86666532724', :category_id => @cat.id)
    assert c2.errors.invalid?(:cpf)

    # another organization can have the same supplier registered
    c3 = Customer.new(:name => 'Testing unique CNPJ (another organization)', :email => 'te@sdef', :organization_id => 2, :cpf => '86666532724')
    assert c3.errors.empty?
  end

  def test_cnpj_or_cpf
    c = Customer.create(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization_id => 1, :category_id => @cat.id)
    assert c.errors.invalid?(:cnpj)
  end

  def test_full_text_search
   Customer.delete_all
    c1 = Customer.create!(:name => 'Testing something', :email => 'teste2@teste', :organization_id => 1, :cpf => '86666532724', :category_id => @cat.id)
    c2 = Customer.create!(:name => 'Tes somenthig', :email => 'teste2@teste', :organization_id => 1, :cpf => '279.387.834-04', :category_id => @cat.id)
    customers = Customer.full_text_search('Test*')
    assert_equal 1, customers.length
    assert customers.include?(c1)
  end

end
