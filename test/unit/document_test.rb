require File.dirname(__FILE__) + '/../test_helper'

class DocumentTest < Test::Unit::TestCase
  fixtures :documents, :departments_documents, :document_sections, :organizations, :departments

  def test_bli
    assert true
  end

  def test_mandatory_fields
    count = Document.count

    cp = Document.new
    assert !cp.save
    cp.name = 'Proposal Test 2'
    assert !cp.save
    cp.is_template = false
    assert !cp.save
    cp.organization_id = 1
    assert !cp.save
    cp.departments.concat(Department.find(1))
    assert cp.save

    cp = Document.new
    assert !cp.save
    cp.name = 'Proposal Test 3'
    assert !cp.save
    cp.organization_id = 1
    assert !cp.save
    cp.is_template = true
    assert !cp.save
    cp.departments.concat(Department.find(1))
    assert cp.save
    
    assert_equal count + 2, Document.count
  end

  def test_uniqueness_name
    cp1 = Document.new
    cp1.organization_id = 1
    cp1.name = 'One Document'
    cp1.is_template = true
    cp1.departments.concat(Department.find(1))
    assert cp1.save

    cp2 = Document.new
    cp2.organization_id = 1
    cp2.name = 'One Document'
    cp2.is_template = true
    cp2.departments.concat(Department.find(1))
    assert !cp2.save
  end

  def test_create
    count = Document.count

    cp = Document.new
    cp.name = 'Another Document'
    cp.organization_id = 1
    cp.is_template = true
    cp.departments.concat(Department.find(1))
    assert cp.save

    assert_equal count + 1, Document.count
  end

  def test_destroy
    count = Document.count
    cp = Document.find(1)
    assert_not_nil cp
    cp.destroy
    assert_equal count - 1, Document.count
    assert_raise(ActiveRecord::RecordNotFound) {
      Document.find(1)
    }

  end

  def test_fixtures_if_valid
    Document.find(:all).each do |cp|
      assert cp.valid?
    end
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
    cp = Document.find(1)
    assert_equal 2, cp.departments.count
  end

  def test_organization
    cp = Document.find(1)
    assert_equal cp.organization, Organization.find(1)
  end

end
