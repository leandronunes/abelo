require File.dirname(__FILE__) + '/../test_helper'

class DocumentTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @department = create_department
    @customer_category = create_customer_category
    @customer = create_customer
    @document = create_document
  end

  def test_setup
    assert @organization.valid?
    assert @department.valid?
  end

  def test_mandatory_field_organization
    d = Document.new()
    d.valid?
    assert d.errors.invalid?(:organization_id)
    d.organization = Organization.find(:first)
    d.valid?
    assert !d.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_name
    d = Document.new()
    d.valid?
    assert d.errors.invalid?(:name)
    d.name = "Another name"
    d.valid?
    assert !d.errors.invalid?(:name)
  end

  def test_uniqueness_of_name
    d = Document.new(:name => 'Some Another Document', :organization => @organization, :is_model => true)
    departments = Organization.find(1).departments
    d.departments = departments
    assert d.save

    d = Document.new(:name => 'Some Another Document', :organization => @organization, :is_model => true)
    departments = Organization.find(1).departments
    d.departments = departments
    d.valid?
    assert d.errors.invalid?(:name)
    assert !d.save

  end

  def test_document_sections
    cp = @document
    count = cp.document_sections.count

    cps = create_document_section
    assert_valid cps
    cp.document_sections.concat(cps)
    assert count + 1, cp.document_sections.count
  end

  def test_departments
    d = @document
    count = d.departments.count
    d.departments<< create_department(:name => 'department 1')
    assert_equal count + 1, d.departments.count
  end

  def test_owner
    d = Document.find(1)
    c = Customer.find(:first)
    d.owner = c
    assert_equal c, d.owner
  end

  def test_organization
    d = Document.find(1)
    assert_equal d.organization, Organization.find(1)
  end

  def test_owner_class
    doc = Document.new
    doc.owner = Customer.find(:first)
    assert_equal I18n.t(:customer), doc.owner_class
  end

  def test_document_owner_type
    doc = Document.new
    doc.owner = Customer.find(:first)
    assert_equal 'SystemActor', doc.owner_type 
    assert_equal 'customer', doc.document_owner_type
  end

  def test_document_owner_type=
    doc = Document.new
    doc.document_owner_type = 'customer'
    assert_equal 'customer', doc.document_owner_type
  end

  def test_the_presence_of_document_model_if_its_a_model_itself
    model = Document.new(:name => 'Another Document', :organization => @organization, :is_model => true)
    departments = Organization.find(1).departments
    model.departments = departments
    assert model.save

    d = Document.new(:name => 'Another Document Again', :organization => @organization, :is_model => true)
    departments = Organization.find(1).departments
    d.departments = departments
    d.document_model = model
    assert !d.save
  end

  def test_presence_of_department
    Document.destroy_all
    d = Document.new(:name => 'Another Document Again', :organization => @organization, :is_model => true)
    departments = Organization.find(1).departments
    d.departments = departments
    assert d.save
    documents = Document.full_text_search('Ano*')
    assert_equal 1, documents.length
    assert documents.include?(d)
  end

  def test_presence_owner_model_document
    d = Document.new(:name => 'Some Another Document', :organization => @organization, :is_model => true)
    d.owner = Customer.find(:first)
    departments = Organization.find(1).departments
    d.departments = departments
    d.save
    assert d.errors.size > 0
  end

  def test_presence_owner_document
    d = Document.new(:name => 'Some Another Document', :organization => @organization, :is_model => false)
    d.save
    assert d.errors.invalid?(:owner)    
  end

  def test_model
    Document.models.each do |item|
      assert item.is_model
    end
  end

  def test_dclone
    d = Document.new(:name => 'Another Document Again', :organization => @organization, :is_model => true)
    departments = Organization.find(1).departments
    d.departments = departments
    assert d.save
    doc_copy = d.dclone
    assert_equal  d.departments, doc_copy.departments
  end

  def test_cannot_clone_a_non_model_document
    d = create_document(:name => 'Another Document', :is_model => false)
    assert !d.is_model?
    d_clone = d.dclone
    assert_nil d_clone
  end

  def test_add_new_document_on_tracker_document_points
    document_points = @organization.tracker.document_points
    c = Document.count
    create_document(:name => 'Another document')
    assert_equal document_points + 1, Organization.find_by_identifier('one').tracker.document_points
  end

  def test_add_first_document_on_tracker_document_points
    org = create_organization(:identifier => 'some_id', :cnpj => '62.667.776/0001-17', :name => 'some id')
    assert_equal 0, org.tracker.document_points

    create_document(:name => 'some', :organization => org)
    assert_equal 1, Organization.find_by_identifier('some_id').tracker.document_points
  end

  def test_remove_document_on_tracker_document_points
    document_points = @organization.tracker.document_points
    @organization.documents.first.destroy
    assert_equal document_points - 1, Organization.find_by_identifier('one').tracker.document_points
  end

  def test_remove_uniq_document_on_tracker_document_points
    org = create_organization(:identifier => 'some_id', :cnpj => '62.667.776/0001-17', :name => 'some id')
    assert_equal 0, org.tracker.document_points

    create_document(:name => 'some', :organization => org)
    org.documents.first.destroy
    assert_equal 0, Organization.find_by_identifier('some_id').tracker.document_points
  end  
end
