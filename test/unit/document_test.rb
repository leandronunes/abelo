require File.dirname(__FILE__) + '/../test_helper'

class DocumentTest < Test::Unit::TestCase
  fixtures :documents, :departments_documents, :document_sections, :organizations, :departments

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

  def test_mandatory_field_document_model_if_is_not_a_model_itself
    d = Document.new()
    d.valid?
    assert d.errors.invalid?(:document_model_id)
    model = Document.new(:name => 'Anohter Document', :organization_id => 1, :is_model => true)
    departments = Organization.find(1).departments
    model.departments = departments
    assert model.save
    d.document_model = model
    d.valid?
    assert !d.errors.invalid?(:document_model_id)
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

  def test_organization
    d = Document.find(1)
    assert_equal d.organization, Organization.find(1)
  end

end
