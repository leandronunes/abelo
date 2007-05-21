require File.dirname(__FILE__) + '/../test_helper'

class CommercialProposalItemTest < Test::Unit::TestCase
  fixtures :commercial_proposal_items

  def test_mandatory_fields
    count = CommercialProposalItem.count
    cpi = CommercialProposalItem.new
    assert !cpi.save

    cpi.name = "One CommercialProposalItem"
    assert !cpi.save

    cpi.commercial_proposal_id = 1
    assert !cpi.save

    cpi.item_order = 3
    assert cpi.save
    assert_equal count + 1, CommercialProposalItem.count
  end

  def test_uniqueness
    cpi1 = CommercialProposalItem.new
    cpi1.name = 'One CommercialProposalItem'
    cpi1.commercial_proposal_id = 1
    cpi1.item_order = 3
    assert cpi1.save

    cpi2 = CommercialProposalItem.new
    cpi2.name = 'One CommercialProposalItem'
    cpi2.commercial_proposal_id = 1
    cpi2.item_order = 2
    assert !cpi2.save

    cpi3 = CommercialProposalItem.new
    cpi3.name = 'Another CommercialProposalItem'
    cpi3.commercial_proposal_id = 1
    cpi3.item_order = 1
    assert !cpi3.save
  end

  def test_create
    count = CommercialProposalItem.count
    cpi = CommercialProposalItem.new
    cpi.name = 'Another CommercialProposalItem'
    cpi.commercial_proposal_id = 1
    cpi.item_order = 3
    cpi.size = 'S'
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
    CommercialProposalItem.find_all.each do |cpi|
      assert cpi.valid?
    end
  end

end
