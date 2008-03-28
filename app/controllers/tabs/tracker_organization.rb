def create_tracker_organization_tabs
  t = add_tab do
    links_to :controller => 'tracker_organization'
    in_set 'first'
    highlights_on :controller => 'tracker_organization'
  end
  t.named _('Tracker')

end
