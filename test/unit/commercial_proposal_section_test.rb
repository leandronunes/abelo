require File.dirname(__FILE__) + '/../test_helper'

class CommercialProposalSectionTest < Test::Unit::TestCase
  fixtures :commercial_proposal_sections, :commercial_proposals, :commercial_proposal_items

  def test_create
    count = CommercialProposalSection.count
    cps = CommercialProposalSection.new
    cps.name = 'Name for testing commercial proposal section'
    cps.commercial_proposal_id = 1
    cps.save

    assert_equal count+1, CommercialProposalSection.count
  end

  def test_mandatory_fields
    cps = CommercialProposalSection.new
    assert !cps.save

    cps.name = 'Name for testing commercial proposal section'
    assert !cps.save

    cps.commercial_proposal_id = 1
    assert cps.save
  end

  def test_uniqueness_of_name
    cps = CommercialProposalSection.new
    cps.name = "Section one" 
    cps.commercial_proposal_id = 1
    assert !cps.save

    cps.name = "Name for testing commercial proposal section" 
    assert_valid cps
    assert cps.save
  end

  def test_relation_with_commercial_propsal_item
    cps = CommercialProposalSection.find(1)
    assert_valid cps
    
    count = cps.commercial_proposal_items.count
    cpi = CommercialProposalItem.find(3)
    cps.add_commercial_proposal_items(cpi)

    assert_equal count+1, cps.commercial_proposal_items.count
  end

  def test_relation_with_commercial_proposal    
    cps = CommercialProposalSection.find(1)
    assert_valid cps

    cps.commercial_proposal = CommercialProposal.find(2)

    assert_equal 2, cps.commercial_proposal_id
  end

end
