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
    @sintegra.generate_sintegra
  end

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
