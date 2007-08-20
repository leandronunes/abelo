class BankAccountsController < ApplicationController

  auto_complete_for :bank_account, :account

  needs_organization

  uses_financial_tabs

  def autocomplete_account
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
    @bank_account_pages, @bank_accounts = paginate :bank_accounts, :per_page => 10
  end

  def show
    @bank_account = BankAccount.find(params[:id])
  end

  def new
    @banks = Bank.options
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(params[:bank_account])
    @bank_account.owner = @organization
    if @bank_account.save
      flash[:notice] = 'BankAccount was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @bank_account = BankAccount.find(params[:id])
  end

  def update
    @bank_account = BankAccount.find(params[:id])
    if @bank_account.update_attributes(params[:bank_account])
      flash[:notice] = 'BankAccount was successfully updated.'
      redirect_to :action => 'show', :id => @bank_account
    else
      render :action => 'edit'
    end
  end

  def destroy
    BankAccount.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
