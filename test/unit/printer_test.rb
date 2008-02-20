require File.dirname(__FILE__) + '/../test_helper'

class PrinterTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
  end

  def create_printer(params= {})
    p = new_printer(params)
    p.save!
  end

  def new_printer(params= {})
    Printer.new({:serial => 'test printer', :organization => @organization, :computer_id => 'FF:EE:44:22:GG'}.merge(params))
  end

  def test_setup
    assert @organization.valid?
  end

  def test_presence_of_organization
    p = Printer.new
    p.valid?
    assert p.errors.invalid?(:organization_id)
    p.organization = @organization
    p.valid?
    assert !p.errors.invalid?(:organization_id)
  end

  def test_presence_of_serial
    Printer.destroy_all
    p = Printer.new
    p.valid?
    assert p.errors.invalid?(:serial)
    p.serial = '435345'
    p.valid?
    assert !p.errors.invalid?(:serial)
  end


  def test_presence_of_computer
    Printer.destroy_all
    p = Printer.new
    p.valid?
    assert p.errors.invalid?(:computer_id)
    p.computer_id = '43:FD:45:66:DD:22'
    p.valid?
    assert !p.errors.invalid?(:computer_id)
  end

  def test_uniqueness_of_computer
    Printer.destroy_all
    computer = '00:FF:44:GG:44'
    p1 = create_printer(:computer_id => computer)
    p2 = new_printer(:computer_id => computer)
    p2.valid?
    assert p2.errors.invalid?(:computer_id)
    p2.computer_id = '43:FD:45:66:DD:22'
    p2.valid?
    assert !p2.errors.invalid?(:computer_id)
  end

  def test_full_text_search
    Printer.delete_all 
    p1 = create_printer(:computer_id => 'FF:GG:HH:44', :serial => 'some')
    p2 = create_printer(:computer_id => 'FF:GG:HH:45', :serial => 'another')
    printers = Printer.full_text_search('*44')
    assert_equal 1, printers.length
  end

end
