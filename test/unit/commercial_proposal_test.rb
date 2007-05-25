require File.dirname(__FILE__) + '/../test_helper'

class CommercialProposalTest < Test::Unit::TestCase
  fixtures :commercial_proposals, :commercial_proposals_departments

  def test_mandatory_fields
    count = CommercialProposal.count

    cp = CommercialProposal.new
    assert !cp.save
    cp.name = 'Proposal Test 2'
    assert !cp.save
    cp.is_template = false
    assert !cp.save
    cp.organization_id = 2
    assert cp.save

    cp = CommercialProposal.new
    assert !cp.save
    cp.name = 'Proposal Test 3'
    assert !cp.save
    cp.organization_id = 2
    cp.is_template = true
    assert cp.save
    
    assert_equal count + 2, CommercialProposal.count
  end

  def test_uniqueness_name
    cp1 = CommercialProposal.new
    cp1.organization_id = 2
    cp1.name = 'One CommercialProposal'
    cp1.is_template = true
    assert cp1.save

    cp2 = CommercialProposal.new
    cp2.organization_id = 2
    cp2.name = 'One CommercialProposal'
    cp2.is_template = true
    assert !cp2.save
  end

  def test_create
    count = CommercialProposal.count

    cp = CommercialProposal.new
    cp.name = 'Another CommercialProposal'
    cp.organization_id = 2
    cp.is_template = true
    assert cp.save

    assert_equal count + 1, CommercialProposal.count
  end

  def test_destroy
    count = CommercialProposal.count
    cp = CommercialProposal.find(1)
    assert_not_nil cp
    cp.destroy
    assert_equal count - 1, CommercialProposal.count
    assert_raise(ActiveRecord::RecordNotFound) {
      CommercialProposal.find(1)
    }

  end

  def test_fixtures_if_valid
    CommercialProposal.find_all.each do |cp|
      assert cp.valid?
    end
  end

  def test_commercial_proposal_items
    cp = CommercialProposal.find(1)
    count = cp.commercial_proposal_items.count

    cpi1 = CommercialProposalItem.new
    cpi1.name = 'Description 1'
    invalid_item_order = 100
    assert !(cp.commercial_proposal_items.detect{|c| c.item_order == invalid_item_order })
    cpi1.item_order = invalid_item_order
    cpi1.size = 'S'
    
    cp.add_commercial_proposal_items(cpi1)
    assert count + 1, cp.commercial_proposal_items.count
    assert cpi1.valid?
  end

end
