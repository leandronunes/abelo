require File.dirname(__FILE__) + '/../test_helper'

class PrinterCommandTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @user = create_user
    @printer = create_printer
    @till = create_till(:printer => @printer)
  end

  def test_setup
    assert @organization.valid?
    assert @user.valid?
    assert @printer.valid?
    assert @till.valid?
  end

  def new_printer_command(params = {})
    PrinterCommand.new(@till, (params[:cmd] || ['summarize']))
  end

  def test_validates_inclusion_of_status_on_status_list
    invalid_status = 10
    assert !Status::ALL_STATUS.include?(invalid_status)
    p = new_printer_command
    p.status = invalid_status
    p.valid?
    assert p.errors.invalid?(:status)
  end

  def test_uniqueness_of_cmd_id_on_till_scope
    p = new_printer_command
    p.cmd_id = 1
    assert p.save

    p = new_printer_command
    p.cmd_id = 1
    p.valid?
    assert p.errors.invalid?(:cmd_id)
  end

  def test_till_scope_of_cmd_id_uniqueness
    p = new_printer_command
    p.cmd_id = 1
    assert p.save

    @till = create_till(:printer => @printer)
    p = new_printer_command
    p.cmd_id = 1
    p.valid?
    assert !p.errors.invalid?(:cmd_id)
  end

  def test_uniqueness_of_sequence_number_on_till_scope
    p = new_printer_command
    p.sequence_number = 1
    assert p.save

    p = new_printer_command
    p.sequence_number = 1
    p.valid?
    assert p.errors.invalid?(:sequence_number)
  end

  def test_till_scope_of_sequence_number_uniqueness
    p = new_printer_command
    p.sequence_number = 1
    assert p.save

    @till = create_till(:printer => @printer)
    p = new_printer_command
    p.sequence_number = 1
    p.valid?
    assert !p.errors.invalid?(:sequence_number)
  end

  def test_get_computer_id
    pc_mac  = "01:0F:EA:D7:35:09"
    IO.any_instance.expects(:readlines).returns(["eth0     Encapsulamento do Link: Ethernet  Endereço de HW %s  \n" % pc_mac])
    assert_equal pc_mac, PrinterCommand.get_computer_id
  end

  def test_srt_command_whithout_params
    p = new_printer_command
    p.cmd = 'command'
    p.cmd_params = nil
    assert_equal 'command ', p.str_command 
  end

  def test_srt_command_whith_params
    p = new_printer_command
    p.cmd = 'command'
    p.cmd_params = '1;2;blue'
    assert_equal "command '1;2;blue'", p.str_command 
  end

end
