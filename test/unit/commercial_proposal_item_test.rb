require File.dirname(__FILE__) + '/../test_helper'

class CommercialProposalItemTest < Test::Unit::TestCase
  fixtures :commercial_proposal_items

  def test_mandatory_fields
    cpi = CommercialProposalItem.new
    assert !cpi.save
    cpi.name = "One CommercialProposalItem"
    assert cpi.save
  end

  def test_uniqueness
    cpi1 = CommercialProposalItem.new
    cpi1.name = 'One CommercialProposalItem'
    assert cpi1.save

    cpi2 = CommercialProposalItem.new
    cpi2.name = 'One CommercialProposalItem'
    assert !cpi2.save
  end

  def test_create
    count = CommercialProposalItem.count
    cpi = CommercialProposalItem.new
    cpi.name = 'CommercialProposalItem'
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
