require File.dirname(__FILE__) + '/../test_helper'

class CommercialProposalTest < Test::Unit::TestCase
  fixtures :commercial_proposals, :commercial_proposals_departments, :commercial_proposal_sections, :organizations, :departments

  def test_mandatory_fields
    count = CommercialProposal.count

    cp = CommercialProposal.new
    assert !cp.save
    cp.name = 'Proposal Test 2'
    assert !cp.save
    cp.is_template = false
    assert !cp.save
    cp.organization_id = 1
    assert !cp.save
    cp.departments.concat(Department.find(1))
    assert cp.save

    cp = CommercialProposal.new
    assert !cp.save
    cp.name = 'Proposal Test 3'
    assert !cp.save
    cp.organization_id = 1
    assert !cp.save
    cp.is_template = true
    assert !cp.save
    cp.departments.concat(Department.find(1))
    assert cp.save
    
    assert_equal count + 2, CommercialProposal.count
  end

  def test_uniqueness_name
    cp1 = CommercialProposal.new
    cp1.organization_id = 1
    cp1.name = 'One CommercialProposal'
    cp1.is_template = true
    cp1.departments.concat(Department.find(1))
    assert cp1.save

    cp2 = CommercialProposal.new
    cp2.organization_id = 1
    cp2.name = 'One CommercialProposal'
    cp2.is_template = true
    cp2.departments.concat(Department.find(1))
    assert !cp2.save
  end

  def test_create
    count = CommercialProposal.count

    cp = CommercialProposal.new
    cp.name = 'Another CommercialProposal'
    cp.organization_id = 1
    cp.is_template = true
    cp.departments.concat(Department.find(1))
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
    CommercialProposal.find(:all).each do |cp|
      assert cp.valid?
    end
  end

  def test_commercial_proposal_sections
    cp = CommercialProposal.find(1)
    count = cp.commercial_proposal_sections.count

    cps = CommercialProposalSection.find(1)
    assert_valid cps
    cp.commercial_proposal_sections.concat(cps)
    assert count + 1, cp.commercial_proposal_sections.count
  end

  def test_departments
    cp = CommercialProposal.find(1)
    assert_equal 2, cp.departments.count
  end

  def test_organization
    cp = CommercialProposal.find(1)
    assert_equal cp.organization, Organization.find(1)
  end

end
