module FinancialInformation

  def get_financial_variables(object)
    @chosen_categories = params[:categories].blank? ? Array.new : params[:categories].split(',') 
    @chosen_categories.delete(params[:chosen_category])

    @chosen_tags = params[:tags].blank? ? Array.new : params[:tags].split(',') 
    @chosen_tags.delete(params[:chosen_tag])

    begin
      @chosen_accounts = params[:accounts].split(',')
      @chosen_accounts = organization.bank_accounts.find(@chosen_accounts)
    rescue
      @chosen_accounts = [@organization.default_bank_account]
    end
 
    begin
      year = params[:start_date_year].to_i 
      month = params[:start_date_month].to_i
      day = params[:start_date_day].to_i
      max_day = Time::days_in_month(month, year)
      @start_date = DateTime.new(year, month, (day > max_day ? max_day : day))
    rescue
      @start_date = DateTime.new(Date.today.year, Date.today.month, 1)
    end

    begin 
      year = params[:end_date_year].to_i 
      month = params[:end_date_month].to_i
      day = params[:end_date_day].to_i
      max_day = Time::days_in_month(month, year)
      @end_date = DateTime.new(year, month, (day > max_day ? max_day : day))
      @end_date = DateTime.end_of_month(@start_date) if @end_date < @start_date
    rescue
      @end_date = DateTime.end_of_month(@start_date)
    end
     
    @start_date_day = @start_date.day
    @start_date_month = @start_date.month
    @start_date_year = @start_date.year

    @end_date_day = @end_date.day
    @end_date_month = @end_date.month
    @end_date_year = @end_date.year
    @query = params[:query] unless params[:query].blank?

    #@last_balance = Balance.last_balance_before_date(object, @chosen_accounts.first, @start_date)

    begin
      @chosen_accounts = @organization.bank_accounts.find(@chosen_accounts)
      @chosen_categories = @organization.ledger_categories.find(@chosen_categories)
    rescue
      @chosen_categories = Array.new
      @chosen_accounts = Array.new
    end
    
    @bank_accounts = @organization.bank_accounts
    @tags = @organization.tags_by_bank_account(@chosen_accounts)

    @common_financial_parameters = params.merge({:query => @query, :accounts => @chosen_accounts.ids, :tags => @chosen_tags.join(','), :start_date_day => @start_date_day, :start_date_month => @start_date_month, :start_date_year => @start_date_year, :end_date_day => @end_date_day, :end_date_month => @end_date_month, :end_date_year => @end_date_year, :id => object.id,  :categories => @chosen_categories.ids})

   @common_observer_financial_parameters = @common_financial_parameters.collect{|k,v| "'&"+k.to_s+"='"+" +  escape('"+v.to_s+"')"}.join(" + ")

  end

end
