require File.dirname(__FILE__) + '/../test_helper'

class DocumentSectionTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @department = create_department
    @customer_category = create_customer_category
    @customer = create_customer
    @document = create_document
    @document_section = create_document_section(:document_id => @document.id)
  end

  def test_create
    count = DocumentSection.count
    cps = DocumentSection.new
    cps.name = 'Name for testing commercial proposal section'
    cps.document_id = 1
    cps.save

    assert_equal count+1, DocumentSection.count
  end

  def test_mandatory_fields
    cps = DocumentSection.new
    assert !cps.save

    cps.name = 'Name for testing commercial proposal section'
    assert !cps.save

    cps.document_id = 1
    assert cps.save
  end

  def test_uniqueness_of_name
    cps = DocumentSection.new
    cps.name = @document_section.name
    cps.document_id = 1
    assert !cps.save

    cps.name = "Name for testing commercial proposal section" 
    assert_valid cps
    assert cps.save
  end

  def test_relation_with_commercial_propsal_item
    cps = @document_section
    assert_valid cps
    
    count = cps.document_items.count
    cpi = create_document_item
    cps.document_items.concat(cpi)

    assert_equal count+1, cps.document_items.count
  end

  def test_relation_with_document    
    cps = @document_section
    assert_equal cps.document_id, @document.id

    document = create_document(:name => 'another name')
    cps.document = document
    cps.save
    assert_equal document.id, cps.document_id
  end

  def test_before_destroy
    s = @document_section
    s.document_items = [create_document_item]
    assert !s.document_items.empty?
    items = s.document_items
    s.destroy
    items.each{ |i|
      assert_raise(ActiveRecord::RecordNotFound){
        DocumentItem.find(i)
      }
    }
  end

end
