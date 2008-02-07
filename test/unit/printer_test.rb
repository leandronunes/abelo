require File.dirname(__FILE__) + '/../test_helper'

class PrinterTest < Test::Unit::TestCase

  def setup
    @organization = Organization.find(:first)
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


end
