require File.dirname(__FILE__) + '/../test_helper'

class CommercialProposalItemTest < Test::Unit::TestCase
  fixtures :commercial_proposal_items, :products

  def test_mandatory_fields
    count = CommercialProposalItem.count
    cpi = CommercialProposalItem.new
    assert !cpi.save

    cpi.quantity = 4
    assert !cpi.save

    cpi.unitary_value = 10
    assert !cpi.save

    cpi.product_id = 1
    assert !cpi.save

    cpi.commercial_proposal_section_id = 1
    assert cpi.save

    assert_equal count + 1, CommercialProposalItem.count
  end

  def test_create
    count = CommercialProposalItem.count
    cpi = CommercialProposalItem.new
    cpi.quantity = 4
    cpi.unitary_value = 10
    cpi.commercial_proposal_section_id  = 1
    cpi.product_id = 1
    assert cpi.save
   
    assert_equal count + 1, CommercialProposalItem.count
  end

  def test_destroy
    count = CommercialProposalItem.count
    cpi = CommercialProposalItem.find(1)
    assert_not_nil cpi
    cpi.destroy
    assert_equal count - 1, CommercialProposalItem.count
    assert_raise(ActiveRecord::RecordNotFound) {
      CommercialProposalItem.find(1)
    }

  end

  def test_fixtures_if_valid
    CommercialProposalItem.find(:all).each do |cpi|
      assert cpi.valid?
    end
  end

  def test_total_value
    cpi = CommercialProposalItem.find(1)
    assert_equal 50, cpi.total_value
  end

  def test_description
    cpi = CommercialProposalItem.find(1)
    assert_equal 'Ice Cream', cpi.description
  end

  def test_validate
    cpi = CommercialProposalItem.new
    cpi.commercial_proposal_section_id = 1
    cpi.unitary_value = 2.0
    cpi.quantity = 5
    assert !cpi.save
    assert_equal 1, cpi.errors.count
  end

end
