class BankDisplay < DisplayConfiguration

  def self.available_fields
    %w[
      name
      code
      site
    ]
  end

  def self.describe(field)
    {
      'name' =>  I18n.t(:name),
      'code' => I18n.t(:code),
      'site' => I18n.t(:web_site),
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
