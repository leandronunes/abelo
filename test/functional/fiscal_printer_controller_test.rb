require File.dirname(__FILE__) + '/../test_helper'
require 'fiscal_printer_controller'

# Re-raise errors caught by the controller.
class FiscalPrinterController; def rescue_action(e) raise e end; end

class FiscalPrinterControllerTest < Test::Unit::TestCase

  under_organization :one

  def setup
    @controller = FiscalPrinterController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization = Organization.find_by_identifier('one')
    login_as("quentin")
  end

  def create_printer(params= {})
    Printer.create!({:serial => 'test printer', :organization => @organization, :computer_id => 'FF:EE:44:22:GG'}.merge(params))
  end

  def test_setup
    assert @organization.valid?
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_autocomplete_printer_serial
    Printer.delete_all
    printer = create_printer
    get :autocomplete_printer_serial, :printer => { :serial => 'test'}
    assert_not_nil assigns(:printers)
    assert_kind_of Array, assigns(:printers)
    assert_equal 1, assigns(:printers).length
    assert_response :success
    assert_template 'autocomplete_printer_serial'
  end

  def test_list_when_query_is_nil
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:printer_pages)
    assert_not_nil assigns(:printers)
    assert_kind_of Array, assigns(:printers)
  end


  def test_list_when_query_param_not_nil
    Printer.delete_all
    create_printer(:computer_id => 'DD:FF:HH:44:33', :serial => 'Test 1')
    create_printer(:computer_id => 'DD:FF:HH:44:32', :serial => 'Test 2')
    create_printer(:computer_id => 'DD:FF:HH:44:31', :serial => 'Another Test')
    get :list, :query => 'Another*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:printers)
    assert_kind_of Array, assigns(:printers)
    assert_not_nil assigns(:printer_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:printer_pages)
  end

  def test_new
    PrinterCommand.expects(:get_serial).returns('342343')
    get :new
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:printer)
  end

  def test_create
    PrinterCommand.stubs(:get_serial).returns('342343')
    post :create, :printer => {:computer_id => '34:34:DD:FF', :serial => '324324'}
    assert_response :redirect
    assert_redirected_to :action => 'list'
    assert_not_nil assigns(:printer)
  end

  def test_create_unsuccessfully
    # The serial cannot be nil
    PrinterCommand.expects(:get_serial).returns('342343')

    post :create, :printer => {:computer_id => '34:34:DD:FF', :serial => nil}
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:printer)
  end

  def test_edit
    PrinterCommand.expects(:get_serial).returns('342343')
    printer = create_printer
    get :edit, :id => printer.id 
    assert_response :success
    assert_template 'edit'
    assert_not_nil assigns(:printer)
  end

  def test_show
    printer = create_printer
    get :show, :id => printer.id 
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:printer)
  end

  def test_update
    printer = create_printer
    get :update, :id => printer.id, :printer => {:computer_id => 'FF:DD:44'}
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_computer_id
    printer = create_printer
    new_value = 'DD:WW:EE:33:22'
    assert_not_equal new_value, printer.computer_id
    get :update, :id => printer.id, :printer => {:computer_id => new_value}
    assert_equal new_value, Printer.find(printer.id).computer_id
  end

  def test_update_serial
    printer = create_printer
    new_value = '34234'
    assert_not_equal new_value, printer.serial
    get :update, :id => printer.id, :printer => {:serial => new_value}
    assert_equal new_value, Printer.find(printer.id).serial
  end

  def test_update_name
    printer = create_printer
    new_value = 'some name'
    assert_not_equal new_value, printer.name
    get :update, :id => printer.id, :printer => {:name => new_value}
    assert_equal new_value, Printer.find(printer.id).name
  end

  def test_wrong_update
    PrinterCommand.expects(:get_serial).returns('342343')
    printer = create_printer
    # The serial cannot be nil
    get :update, :id => printer.id, :printer => {:serial => nil}
    assert_response :success
    assert_template 'edit'
    assert_not_nil assigns(:printer)
  end

  def test_destroy
    printer = create_printer
    
    post :destroy, :id => printer.id
    assert_response :redirect
    assert_redirected_to :action => 'list'
    
    assert_raise(ActiveRecord::RecordNotFound) {
      Product.find(printer.id)
    }

  end

end
