require File.dirname(__FILE__) + '/../test_helper'

class DocumentTest < Test::Unit::TestCase
  fixtures :documents, :departments_documents, :document_sections, :organizations, :departments, :system_actors

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
    d = Document.new(:name => 'Some Another Document', :organization_id => 1, :is_model => true)
    departments = Organization.find(1).departments
    d.departments = departments
    assert d.save

    d = Document.new(:name => 'Some Another Document', :organization_id => 1, :is_model => true)
    departments = Organization.find(1).departments
    d.departments = departments
    d.valid?
    assert d.errors.invalid?(:name)
    assert !d.save

  end

  def test_document_sections
    cp = Document.find(1)
    count = cp.document_sections.count

    cps = DocumentSection.find(1)
    assert_valid cps
    cp.document_sections.concat(cps)
    assert count + 1, cp.document_sections.count
  end

  def test_departments
    d = Document.find(1)
    assert_equal 2, d.departments.count
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

  def test_document_model
    d = Document.find(3)
    assert_equal Document.find(1), d.document_model
  end

  def test_the_presence_of_document_model_if_its_a_model_itself
    model = Document.new(:name => 'Anohter Document', :organization_id => 1, :is_model => true)
    departments = Organization.find(1).departments
    model.departments = departments
    assert model.save

    d = Document.new(:name => 'Anohter Document Again', :organization_id => 1, :is_model => true)
    departments = Organization.find(1).departments
    d.departments = departments
    d.document_model = model
    assert !d.save
  end

  def test_presence_of_department
    Document.destroy_all
    d = Document.new(:name => 'Anohter Document Again', :organization_id => 1, :is_model => true)
    departments = Organization.find(1).departments
    d.departments = departments
    assert d.save
    documents = Document.full_text_search('Ano*')
    assert_equal 1, documents.length
    assert documents.include?(d)
  end

  def test_dclone
    d = Document.new(:name => 'Anohter Document Again', :organization_id => 1, :is_model => true)
    departments = Organization.find(1).departments
    d.departments = departments
    assert d.save
    doc_copy = d.dclone
    assert_equal  d.departments, doc_copy.departments
  end

  def test_dclone_not_model_document
    d = Document.new(:name => 'Anohter Document Again', :organization_id => 1, :is_model => false)
    departments = Organization.find(1).departments
    d.departments = departments
    assert d.save
    doc_copy = d.dclone
    assert_equal  d.departments, doc_copy.departments
    assert !doc_copy.valid?
    assert doc_copy.errors.invalid?(:document_model_id)
  end

end
