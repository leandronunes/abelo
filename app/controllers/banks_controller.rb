class BanksController < ApplicationController

  needs_administrator

  before_filter :create_tabs

  def autocomplete_bank_name
    escaped_string = Regexp.escape(params[:bank][:name])
    re = Regexp.new(escaped_string, "i")
    @banks = Bank.find(:all).select { |b| b.name.match re}
    render :layout=>false
  end

  def index
    redirect_to :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @banks = Bank.paginate(:per_page => 10, :page => params[:page])
  end

  def show
    @bank = Bank.find(params[:id])
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(params[:bank])
    if @bank.save
      flash[:notice] = 'Bank was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @bank = Bank.find(params[:id])
  end

  def update
    @bank = Bank.find(params[:id])
    if @bank.update_attributes(params[:bank])
      flash[:notice] = 'Bank was successfully updated.'
      redirect_to :action => 'show', :id => @bank
    else
      render :action => 'edit'
    end
  end

  def destroy
    Bank.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def create_tabs
    t = add_tab do      
      links_to :controller => 'banks'
      in_set 'first'
      highlights_on :controller => 'banks'
    end
    t.named t(:banks)
  end

end
