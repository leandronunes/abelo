class LedgerCategoriesController < ApplicationController

  auto_complete_for :category, :name

  needs_organization

  uses_financial_tabs

  def autocomplete_name
    escaped_string = Regexp.escape(params[:category][:name])
    re = Regexp.new(escaped_string, "i")
    @categories = @organization.ledger_categories.select { |lc| lc.name.match re}
    render :layout=>false
  end

  def index
    redirect_to :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update, :autocomplete_name ],
         :redirect_to => { :action => :list }

  def list
    categories = @organization.ledger_categories
    @category_pages, @categories = paginate_by_collection categories
  end

  def show
    @category = LedgerCategory.find(params[:id])
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
    redirect_to :action => 'list'
  end

end
