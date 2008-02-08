class FiscalPrinterController < ApplicationController

  needs_organization

  uses_configurations_tabs

  def autocomplete_printer_serial
    escaped_string = Regexp.escape(params[:printer][:serial])
    re = Regexp.new(escaped_string, "i")
    @printers = @organization.printers.select { |p| p.serial.match re}
    render :layout=>false
  end

  def index
    redirect_to :action => 'list'
  end

  def list
    @query = params[:query]
    @query ||= params[:printer][:serial] if params[:printer]

    if @query.nil?
      @printers = @organization.printers
      @printer_pages, @printers = paginate_by_collection @printers
    else
      @printers = @organization.printers.full_text_search(@query)
      @printer_pages, @printers = paginate_by_collection @printers
    end
  end

  def show
    @printer = @organization.printers.find(params[:id])
  end

  def new
    @printer = Printer.new
    @printer.computer_id = PrinterCommand.get_computer_id.strip
    @printer.serial = PrinterCommand.get_serial.strip
  end

  def create
    @printer = Printer.new(params[:printer])
    @printer.organization = @organization
    if @printer.save
      redirect_to :action => 'list'
    else
      @printer.computer_id = PrinterCommand.get_computer_id.strip
      @printer.serial = PrinterCommand.get_serial.strip
      render :action => 'new'
    end
  end

  def edit
    @printer = @organization.printers.find(params[:id])
    @printer.computer_id = PrinterCommand.get_computer_id.strip
    @printer.serial = PrinterCommand.get_serial.strip
  end

  def update
    @printer = @organization.printers.find(params[:id])
    if @printer.update_attributes(params[:printer])
      redirect_to :action => 'list'
    else
      @printer.computer_id = PrinterCommand.get_computer_id.strip
      @printer.serial = PrinterCommand.get_serial.strip
      render :action => 'edit'
    end
  end

  def destroy
    @printer = @organization.printers.find(params[:id])
    @printer.destroy
    redirect_to :action => 'list'
  end

end
