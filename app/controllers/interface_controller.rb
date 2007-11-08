class InterfaceController < ApplicationController

  needs_organization

  uses_configurations_tabs

  design_editor :holder => 'organization', :autosave => true, :block_types => :block_types

   def block_types
    %w[
       FavoriteLinksOrganization
       FinancialForecasting
     ] 
  end

  def index
    redirect_to :action => 'design_editor_change_template'
  end

end
