class WebsiteInterfaceController < ApplicationController

  needs_environment

  uses_website_tabs

  design_editor :holder => 'environment', :autosave => true, :block_types => :block_types

  layout :set_layout

  def set_layout
    File.join('organizations', @organization.identifier)
  end


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
