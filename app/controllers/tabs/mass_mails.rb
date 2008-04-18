def create_mass_mails_tabs
  t = add_tab do
    links_to :controller => 'mass_mails'
    in_set 'first'
    highlights_on :controller => 'mass_mails'
  end
  t.named _('Mass Mails')

  t = add_tab do
    links_to :controller => 'mass_mail_groups'
    in_set 'first'
    highlights_on :controller => 'mass_mail_groups'
  end
  t.named _('Mass Mails Groups')

end
