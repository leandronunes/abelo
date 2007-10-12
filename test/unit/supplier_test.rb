require File.dirname(__FILE__) + '/../test_helper'

class SupplierTest < Test::Unit::TestCase

  fixtures :organizations

  def setup
    @organization = Organization.find_by_identifier('six') 
    @category = SupplierCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
  end

  def test_setup
    assert @organization.valid?
    assert @category.valid?
  end

  def test_relation_with_organization
    supplier= Supplier.new
    supplier.organization = @organization
    assert_equal @organization, supplier.organization
  end

  def test_relation_with_contact
    supplier= Supplier.new
    contact = Contact.new
    supplier.contacts.concat(contact)
    assert supplier.contacts.include?(contact)
  end

  def test_mandatory_field_name
    supplier = Supplier.create(:email => 'teste@teste', :organization_id => 1, :category_id => @category.id, :cpf => '23831442312')
    assert supplier.errors.invalid?(:name)
  end

  def test_mandatory_field_organization_id
    supplier = Supplier.create(:name => 'new customer', :email => 'teste@teste', :category_id => @category.id, :cpf => '23831442312')
    assert supplier.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_category_id
    supplier = Supplier.create(:name => 'new customer', :email => 'teste@teste', :organization_id => 1, :cpf => '23831442312')
    assert supplier.errors.invalid?(:category_id)
  end

  def test_mandatory_field_email
    supplier = Supplier.create(:name => 'new customer', :organization_id => 1, :category_id => @category.id, :cpf => '23831442312')
    assert supplier.errors.invalid?(:email)
  end

  def test_cnpj_valid_format
    supplier = Supplier.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @category.id, :cnpj => '27122113000116')
    assert supplier.errors.empty?
  end

  def test_cnpj_invalid_format
    supplier = Supplier.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @category.id, :cnpj => '00000000000000')
    assert supplier.errors.invalid?(:cnpj)
  end

  def test_cpf_valid_format
    supplier = Supplier.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @category.id, :cpf => '86666532724')
    assert supplier.errors.empty?
  end

  def test_cpf_invalid_format
    supplier = Supplier.create(:name => 'customer', :email => 'teste@teste', :organization_id => 1, :category_id => @category.id, :cpf => '00000000000')
    assert supplier.errors.invalid?(:cpf)
  end

  def test_cnpj_uniq
    c1 = Supplier.create(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization_id => 1, :cnpj => '22071350000181', :category_id => @category.id)

    # the same organization cannot have the same supplier registered twice
    c2 = Supplier.create(:name => 'Testing unique CNPJ (second)', :email => 'teste3@teste', :organization_id => 1, :cnpj => '22071350000181', :category_id => @category.id)
    assert c2.errors.invalid?(:cnpj)

    # another organization can have the same supplier registered
    c3 = Supplier.new(:name => 'Testing unique CNPJ (another organization)', :email => 'te@sdef', :organization_id => 2, :cnpj => '22071350000181')
    assert c3.errors.empty?
  end

  def test_cpf_uniq
    c1 = Supplier.create(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization_id => 1, :cpf => '86666532724', :category_id => @category.id)

    # the same organization cannot have the same supplier registered twice
    c2 = Supplier.create(:name => 'Testing unique CNPJ (second)', :email => 'teste3@teste', :organization_id => 1, :cpf => '86666532724', :category_id => @category.id)
    assert c2.errors.invalid?(:cpf)

    # another organization can have the same supplier registered
    c3 = Supplier.new(:name => 'Testing unique CNPJ (another organization)', :email => 'te@sdef', :organization_id => 2, :cpf => '86666532724')
    assert c3.errors.empty?
  end

  def test_presence_of_cnpj_or_cpf
    c = Supplier.new(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization => @organization, :category => @category)
    c.valid?
    assert c.errors.invalid?(:person_type)
    c.person_type = 'natural'
    c.cpf = '864.517.456-18'
    c.valid?
    assert !c.errors.invalid?(:cnpj)
    assert !c.errors.invalid?(:cpf)
    c.cpf = nil
    c.valid?
    assert c.errors.invalid?(:person_type)
    c.person_type = 'juristic'
    c.cnpj = '45.581.212/0001-48'
    c.valid?
    assert !c.errors.invalid?(:cnpj)
    assert !c.errors.invalid?(:cpf)
  end

  def test_presence_of_cnpj
    c = Supplier.new(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization => @organization, :category => @category)
    c.person_type = 'juristic'
    c.valid?
    assert c.errors.invalid?(:cnpj)
    c.cnpj = '45.581.212/0001-48'
    c.valid?
    assert !c.errors.invalid?(:cnpj)
  end

  def test_presence_of_cpf
    c = Supplier.new(:name => 'Testing unique CNPJ (first)', :email => 'teste2@teste', :organization => @organization, :category => @category)
    c.person_type = 'natural'
    c.valid?
    assert c.errors.invalid?(:cpf)
    c.cpf = '864.517.456-18'
    c.valid?
    assert !c.errors.invalid?(:cpf)
  end


  def test_full_text_search
   Supplier.delete_all
    c1 = Supplier.create!(:name => 'Testing something', :email => 'teste2@teste', :organization_id => 1, :cpf => '86666532724', :category_id => @category.id)
    c2 = Supplier.create!(:name => 'Tes somenthig', :email => 'teste2@teste', :organization_id => 1, :cpf => '279.387.834-04', :category_id => @category.id)
    customers = Supplier.full_text_search('Test*')
    assert_equal 1, customers.length
    assert customers.include?(c1)
  end

  def test_valid_cpf_with_length_greater_than_11
    c = Supplier.new(:name => 'Testing something', :email => 'teste2@teste', :organization_id => 1, :cpf => '86666532724', :category => @category)
    assert c.save
    c.cpf= '346.216.694-86'
    assert c.save!
  end
    
  def test_valid_cnpj_with_length_greater_than_11
    c = Supplier.new(:name => 'Testing something', :email => 'teste2@teste', :organization_id => 1, :cnpj => '56447596000127', :category => @category)
    assert c.save
    c.cnpj= '21.377.631/0001-02'
    assert c.save!
  end

end
