class BankDisplay < ActiveRecord::Base

  def self.available_fields
    %w[
      name
      code
      site
    ]
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'code' => _('Code'),
      'site' => _('Web Site'),
    }[field] || field
  end

  def self.inlist_available_fields
    ['name', 'code', 'site']
  end

  def self.break_lines
    ['name']
  end

  def self.titles
    self.available_fields
  end

end
