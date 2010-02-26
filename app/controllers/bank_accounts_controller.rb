class BankAccountsController < ApplicationController

  auto_complete_for :bank_account, :account

  needs_organization

  uses_financial_tabs

  def autocomplete_bank_account_account
    escaped_string = Regexp.escape(params[:bank_account][:account])
    re = Regexp.new(escaped_string, "i")
    @bank_accounts = @organization.bank_accounts.select { |ba| ba.account.match re}
    render :layout=>false
  end

  def index
    redirect_to :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @query = params[:query]
    @query ||= params[:bank_account][:account] if params[:bank_account]

    if @query.nil?
      @bank_accounts = @organization.bank_accounts.paginate(:per_page => 10,:page => params[:page] )
    else
      @bank_accounts = @organization.bank_accounts.full_text_search(@query).paginate(:per_page => 10,:page => params[:page] )
    end
  end

  def show
    begin
      @bank_account = @organization.bank_accounts.find(params[:id])
    rescue
      @message = t(:this_bank_account_was_not_found)
      render :template => 'shared/not_found'
      return
    end
  end

  def new
    @banks = Bank.find(:all)
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(params[:bank_account])
    @bank_account.organization = @organization
    if @bank_account.save
      flash[:notice] = t(:successfully_created)
      redirect_to :action => 'list'
    else
      @banks = Bank.find(:all)
      render :action => 'new'
    end
  end

  def edit
    @banks = Bank.find(:all)
    begin
      @bank_account = @organization.bank_accounts.find(params[:id])
    rescue
      @message = t(:this_bank_account_was_not_found)
      render :template => 'shared/not_found'
      return
    end
  end

  def update
    begin
      @bank_account = @organization.bank_accounts.find(params[:id])
    rescue
      @message = t(:this_bank_account_was_not_found)
      render :template => 'shared/not_found'
      return
    end

    if @bank_account.update_attributes(params[:bank_account])
      flash[:notice] = t(:successfully_updated)
      redirect_to :action => 'list'
    else
      @banks = Bank.find(:all)
      render :action => 'edit'
    end
  end

  def destroy
    begin
      BankAccount.find(params[:id]).destroy
      redirect_to :action => 'list'
    rescue
      @message = t(:this_bank_account_was_not_found)
      render :template => 'shared/not_found'
    end
  end
end
