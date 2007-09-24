def create_financial_tabs
  t = add_tab do
    links_to :controller => 'ledgers'
    in_set 'first'
  end
  t.named _('Ledgers')

  t = add_tab do
    links_to :controller => 'bank_accounts'
    in_set 'first'
  end
  t.named _('Bank Accounts')

  t = add_tab do
    links_to :controller => 'ledger_categories'
    in_set 'first'
  end
  t.named _('Ledger Category')

end
