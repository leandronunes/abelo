module LedgerCategoriesHelper
  def type_of_ledger_category(type)
    if type.to_s == 'I'
      LedgerCategory::TYPE_OF['I'] 
    elsif type.to_s == 'O'
      LedgerCategory::TYPE_OF['O'] 
    end
  end
end
