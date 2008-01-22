class SintegraController < ApplicationController

  needs_organization

  before_filter :create_sales_tabs

  def index
    redirect_to :action => 'configure_sintegra'
  end

  def configure_sintegra
    @sintegra = Sintegra.new(@organization)
  end

  def build_file
    @sintegra = Sintegra.new(@organization,params[:sintegra])
    #render :text => params.inspect
    #return
    if @sintegra.generate_sintegra
      flash[:notice] = _('Sintegra File was successfully created.')
      redirect_to :action => 'configure_sintegra'
    else
      render :action => 'configure_sintegra'
    end
  end

#  def write_file
#    @sintegra = Sintegra.new(@organization)
#    @sintegra.generate_sintegra
#  end

  def sales_tabs
    t = add_tab do
      links_to :controller => 'sales'
      in_set 'first'
      highlights_on :controller => 'sales'
    end
    t.named _('Sales')

    t = add_tab do
      links_to :controller => 'sintegra'
      in_set 'first'
      highlights_on :controller => 'sintegra'
    end
    t.named _('Sintegra')
  end
end
