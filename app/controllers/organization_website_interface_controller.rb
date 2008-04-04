class OrganizationWebsiteInterfaceController < ApplicationController

  needs_environment

  uses_website_tabs

  design_editor :interface_holder => 'organization', :content_holder => 'environment', :autosave => true, :block_types => :block_types

  def index
    redirect_to :action => 'design_editor'
  end

  def block_types
    %w[
       MenuWebsite
       ArticlePath
       ArticleSubitems
     ] 
  end

end
