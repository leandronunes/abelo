class SintegraController < ApplicationController

  needs_organization

  uses_sales_tabs

  def generate
    sintegra = SintegraGenerator.new(:organization => @organization, :month => params[:date][:month], :year => params[:date][:year])
    send_file(sintegra.generate.path,
          :disposition => 'downloaded',
          :type => 'text',
          :filename => sintegra.filename)
  end

end
