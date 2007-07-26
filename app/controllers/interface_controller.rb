class InterfaceController < ApplicationController

  needs_organization

  before_filter :create_configurations_tabs

  uses_flexible_template :edit => true, :owner => 'organization'
  

end
