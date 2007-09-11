require File.dirname(__FILE__) + '/../test_helper'

class MassMailDisplayTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
  end

  def test_available_fields_are_valids
    mass_mail = MassMail.new(:subject => 'Mass Mail for testing', :organization_id => @org.id, :body => 'testing mass mail')
    assert_kind_of Array, MassMailDisplay.available_fields
    MassMailDisplay.available_fields.each do |field|
      assert_nothing_raised { mass_mail.send("#{field}")}
    end
  end

  def test_available_fields_have_title_method
    mass_mail = MassMail.new(:subject => 'Mass Mail for testing', :organization_id => @org.id, :body => 'testing mass mail')
    MassMailDisplay.available_fields.each do |field|
      assert MassMailDisplay.methods.include?("title_#{field}")
    end 
  end

  def test_title_subject
    assert_kind_of String, MassMailDisplay.title_subject
  end

  def test_title_body
    assert_kind_of String, MassMailDisplay.title_body
  end

end
