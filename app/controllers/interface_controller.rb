class InterfaceController < ApplicationController

  needs_organization

  before_filter :create_configurations_tabs

  design_editor :holder => 'organization', :autosave => true, :block_types => :block_types

   def block_types
    {
      'ListBlock' => _("List Block"),
      'LinkBlock' => _("Link Block"),
      'Design::MainBlock' => _('Main content block'),
    }
  end


end
