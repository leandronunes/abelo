require File.dirname(__FILE__) + '/../test_helper'

class CommercialProposalItemTest < Test::Unit::TestCase
  fixtures :commercial_proposal_items

  def test_mandatory_fields
    count = CommercialProposalItem.count
    cpi = CommercialProposalItem.new
    assert !cpi.save

    cpi.name = "One CommercialProposalItem"
    assert !cpi.save

    cpi.quantity = 4
    assert !cpi.save

    cpi.unitary_value = 10
    assert !cpi.save

    cpi.type_of = 'product'
    assert !cpi.save

    cpi.commercial_proposal_section_id = 1
    assert cpi.save

    assert_equal count + 1, CommercialProposalItem.count
  end

  def test_create
    count = CommercialProposalItem.count
    cpi = CommercialProposalItem.new
    cpi.name = 'Another CommercialProposalItem'
    cpi.quantity = 4
    cpi.unitary_value = 10
    cpi.type_of = 'product'
    cpi.commercial_proposal_section_id  = 1
    cpi.save
   
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
    CommercialProposalItem.find_all.each do |cpi|
      assert cpi.valid?
    end
  end

  def test_total_value
    cpi = CommercialProposalItem.find(1)
    assert_equal 50, cpi.total_value
  end

end
