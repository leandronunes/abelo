require File.dirname(__FILE__) + '/../test_helper'

class MassMailDisplayTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
  end

  AVAILABLE_FIELDS_TEST = %w[
      subject
      body 
  ]
 
  def test_available_fields_are_valids
    mass_mail = MassMail.new(:subject => 'Mass Mail for testing', :organization_id => @organization.id, :body => 'testing mass mail')
    assert_kind_of Array, MassMailDisplay.available_fields
    MassMailDisplay.available_fields.each do |field|
      assert_nothing_raised { mass_mail.send("#{field}")}
    end
  end

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field,MassMailDisplay.describe(field)
    end
  end

end
