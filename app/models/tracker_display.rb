class TrackerDisplay < DisplayConfiguration

  #FIXME remove info column and moves the information of this filed to the field description

  def self.available_fields
    ['available_points', 'specific_trackers']
  end

  def self.describe(field)
    {
      'available_points' => _('Total available points'),
      'specific_trackers' =>  _('Specific trackers'),
   }[field] || field
  end

end
