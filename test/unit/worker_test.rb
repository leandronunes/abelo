require File.dirname(__FILE__) + '/../test_helper'

class WorkerTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
    @cat = WorkerCategory.create(:name => 'Category for testing', :organization_id => @org.id)
  end

  def test_relation_with_organization
    worker= Worker.new
    worker.organization = @org
    assert_equal @org, worker.organization
  end

  def test_relation_with_contact
    worker= Worker.new
    contact = Contact.new
    worker.contacts.concat(contact)
    assert worker.contacts.include?(contact)
  end

  def test_mandatory_field_name
    worker = Worker.create(:email => 'teste@teste', :organization_id => 1, :category_id => @cat.id, :cpf => '23831442312')
    assert worker.errors.invalid?(:name)
  end

  def test_mandatory_field_organization_id
    worker = Worker.create(:name => 'new customer', :email => 'teste@teste', :category_id => @cat.id, :cpf => '23831442312')
    assert worker.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_category_id
    worker = Worker.create(:name => 'new customer', :email => 'teste@teste', :organization_id => 1, :cpf => '23831442312')
    assert worker.errors.invalid?(:category_id)
  end

  def test_mandatory_field_email
    worker = Worker.create(:name => 'new customer', :organization_id => 1, :category_id => @cat.id, :cpf => '23831442312')
    assert worker.errors.invalid?(:email)
  end

  def test_cnpj_valid_format
    worker = Worker.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @cat.id, :cnpj => '27122113000116')
    assert worker.errors.empty?
  end

  def test_cnpj_invalid_format
    worker = Worker.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @cat.id, :cnpj => '00000000000000')
    assert worker.errors.invalid?(:cnpj)
  end

  def test_cpf_valid_format
    worker = Worker.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @cat.id, :cpf => '86666532724')
    assert worker.errors.empty?
  end

  def test_cpf_invalid_format
    worker = Worker.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @cat.id, :cpf => '00000000000')
    assert worker.errors.invalid?(:cpf)
  end

  def test_cnpj_uniq
    c1 = Worker.create(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization_id => 1, :cnpj => '22071350000181', :category_id => @cat.id)

    # the same organization cannot have the same supplier registered twice
    c2 = Worker.create(:name => 'Testing unique CNPJ (second)', :email => 'teste3@teste', :organization_id => 1, :cnpj => '22071350000181', :category_id => @cat.id)
    assert c2.errors.invalid?(:cnpj)

    # another organization can have the same supplier registered
    c3 = Worker.new(:name => 'Testing unique CNPJ (another organization)', :email => 'te@sdef', :organization_id => 2, :cnpj => '22071350000181')
    assert c3.errors.empty?
  end

  def test_cpf_uniq
    c1 = Worker.create(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization_id => 1, :cpf => '86666532724', :category_id => @cat.id)

    # the same organization cannot have the same supplier registered twice
    c2 = Worker.create(:name => 'Testing unique CNPJ (second)', :email => 'teste3@teste', :organization_id => 1, :cpf => '86666532724', :category_id => @cat.id)
    assert c2.errors.invalid?(:cpf)

    # another organization can have the same supplier registered
    c3 = Worker.new(:name => 'Testing unique CNPJ (another organization)', :email => 'te@sdef', :organization_id => 2, :cpf => '86666532724')
    assert c3.errors.empty?
  end

  def test_cnpj_or_cpf
    c = Worker.create(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization_id => 1, :category_id => @cat.id)
    assert c.errors.invalid?(:cnpj)
  end

  def test_full_text_search
   Worker.delete_all
    c1 = Worker.create!(:name => 'Testing something', :email => 'teste2@teste', :organization_id => 1, :cpf => '86666532724', :category_id => @cat.id)
    c2 = Worker.create!(:name => 'Tes somenthig', :email => 'teste2@teste', :organization_id => 1, :cpf => '279.387.834-04', :category_id => @cat.id)
    customers = Worker.full_text_search('Test*')
    assert_equal 1, customers.length
    assert customers.include?(c1)
  end

end
