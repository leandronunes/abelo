require File.dirname(__FILE__) + '/../test_helper'

class DocumentItemTest < Test::Unit::TestCase

  def setup
    @document_item = create_document_item
  end

  def test_mandatory_fields
    count = DocumentItem.count
    cpi = DocumentItem.new
    assert !cpi.save

    cpi.quantity = 4
    assert !cpi.save

    cpi.unitary_value = 10
    assert !cpi.save

    cpi.product_id = 1
    assert !cpi.save

    cpi.document_section_id = 1
    assert cpi.save

    assert_equal count + 1, DocumentItem.count
  end

  def test_create
    count = DocumentItem.count
    cpi = DocumentItem.new
    cpi.quantity = 4
    cpi.unitary_value = 10
    cpi.document_section_id  = 1
    cpi.product_id = 1
    assert cpi.save
   
    assert_equal count + 1, DocumentItem.count
  end

  def test_destroy
    count = DocumentItem.count
    document_item_id = @document_item.id
    cpi = @document_item
    assert_not_nil cpi
    cpi.destroy
    assert_equal count - 1, DocumentItem.count
    assert_raise(ActiveRecord::RecordNotFound) {
      DocumentItem.find(document_item_id)
    }

  end

  def test_fixtures_if_valid
    DocumentItem.find(:all).each do |cpi|
      assert cpi.valid?
    end
  end

  def test_validate
    cpi = DocumentItem.new
    cpi.document_section_id = 1
    cpi.unitary_value = 2.0
    cpi.quantity = 5
    assert !cpi.save
    assert_equal 1, cpi.errors.count
  end

end
