class SintegraController < ApplicationController

  needs_organization

  uses_sales_tabs

  def index
    redirect_to :action => 'configure_sintegra'
  end

  def configure_sintegra
    @sintegra = Sintegra.new(@organization)
  end

  def build_file
    @sintegra = Sintegra.new(@organization, params[:date][:month], params[:date][:year])
    send_file(@sintegra.generate_sintegra.path,
          :disposition => 'downloaded',
          :type => 'text',
          :filename => "sintegra.txt")

    #render :text => params.inspect
    #return
#    if @sintegra.generate_sintegra
#      flash[:notice] = _('Sintegra File was successfully created.')
#      redirect_to :action => 'configure_sintegra'
#    else
#      render :action => 'configure_sintegra'
#    end
  end

end
