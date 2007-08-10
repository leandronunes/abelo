require File.dirname(__FILE__) + '/../test_helper'

class DocumentSectionTest < Test::Unit::TestCase
  fixtures :document_sections, :documents, :document_items

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
    cps.name = "Section one" 
    cps.document_id = 1
    assert !cps.save

    cps.name = "Name for testing commercial proposal section" 
    assert_valid cps
    assert cps.save
  end

  def test_relation_with_commercial_propsal_item
    cps = DocumentSection.find(1)
    assert_valid cps
    
    count = cps.document_items.count
    cpi = DocumentItem.find(3)
    cps.document_items.concat(cpi)

    assert_equal count+1, cps.document_items.count
  end

  def test_relation_with_document    
    cps = DocumentSection.find(1)
    assert_valid cps

    cps.document = Document.find(2)

    assert_equal 2, cps.document_id
  end

  def test_before_destroy
    s = DocumentSection.find(1)
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
