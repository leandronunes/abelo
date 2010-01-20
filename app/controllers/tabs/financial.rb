def create_financial_tabs
  t = add_tab do
    links_to :controller => 'ledgers'
    in_set 'first'
  end
  t.named t(:ledgers)

  t = add_tab do
    links_to :controller => 'bank_accounts'
    in_set 'first'
  end
  t.named t(:bank_accounts)

  t = add_tab do
    links_to :controller => 'ledger_categories'
    in_set 'first'
  end
  t.named t(:ledger_category)

end
