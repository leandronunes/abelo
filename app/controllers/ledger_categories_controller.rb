class LedgerCategoriesController < ApplicationController

  needs_organization

  uses_financial_tabs

  def index
    redirect_to :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @categories = @organization.ledger_categories
  end

  def new
    @category = LedgerCategory.new
  end

  def create
    @category = LedgerCategory.new(params[:category])
    @category.organization = @organization

    if @category.save
      flash[:notice] = _('Ledger category was successfully created.')
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end

  end

  def edit
    @category = @organization.ledger_categories.find(params[:id])
  end

  def update
    @category = @organization.ledger_categories.find(params[:id])

    if @category.update_attributes(params[:category])
      flash[:notice] = _('Ledger category was successfully updated.')
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end

  end

  def destroy
    @organization.ledger_categories.find(params[:id]).destroy
    render_for :destroy, :success, "list_category_#{params[:id]}"
  end

end
