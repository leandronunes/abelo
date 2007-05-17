class ConfigurationController < ApplicationController

  needs_organization

  CASH_FLOWS_MODELS = %w[
    historical
    specification
  ]

  def index
    @objects = Array.new
    @objects = ['cash_flow']
  end

  def cash_flow
    @models = CASH_FLOWS_MODELS
    @title = _('Cash flow related configurations')
    render :partial => 'models'
  end

end
