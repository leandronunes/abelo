class InterfaceController < ApplicationController

  needs_organization

  before_filter :create_configurations_tabs

  design_editor :holder => 'organization', :autosave => true
 

end
